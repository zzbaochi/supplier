package com.geely.framework.aspectj;

import com.geely.framework.aspectj.lang.annotation.RedisRateLimiter;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.assertj.core.util.Lists;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.scripting.support.ResourceScriptSource;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
 
@Aspect
@Component
@Order(1)
public class RedisLimiterAspect {
    @Autowired
    private HttpServletResponse response;
 
    /**
     * 注入redis操作类
     */
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
 
     private DefaultRedisScript<List> redisScript;
 
    /**
     * 初始化 redisScript 类
     * 返回值为 List
     */
    @PostConstruct
    public void init(){
        redisScript = new DefaultRedisScript<List>();
        redisScript.setResultType(List.class);
        redisScript.setScriptSource(new ResourceScriptSource(new ClassPathResource("limit.lua")));
    }
 
    public final static Logger log = LoggerFactory.getLogger(RedisLimiterAspect.class);
 
    @Pointcut("execution( public * com.geely.project.*.controller.*.*(..))")
    public void pointcut(){
 
    }
    @Around("pointcut()")
    public Object process(ProceedingJoinPoint proceedingJoinPoint) throws  Throwable {
        MethodSignature  signature = (MethodSignature)proceedingJoinPoint.getSignature();
        //使用Java 反射技术获取方法上是否有@RedisRateLimiter 注解类
        RedisRateLimiter redisRateLimiter = signature.getMethod().getDeclaredAnnotation(RedisRateLimiter.class);
        if(redisRateLimiter == null){
            //正常执行方法,执行正常业务逻辑
            return proceedingJoinPoint.proceed();
        }
        //获取注解上的参数，获取配置的速率
        double value = redisRateLimiter.value();
        double time = redisRateLimiter.limit();
 
 
        //list设置lua的keys[1]
        //取当前时间戳到单位秒
        String key = "ip:"+ System.currentTimeMillis() / 1000;
 
        List<String> keyList = Lists.newArrayList(key);
 
        //用户Mpa设置Lua 的ARGV[1]
        //List<String> argList = Lists.newArrayList(String.valueOf(value));
 
        //调用脚本并执行
        //System.out.println("等于0就被限流了"+stringRedisTemplate.execute(redisScript, keyList, String.valueOf(value), String.valueOf(time)));

        Object result = stringRedisTemplate.execute(redisScript, keyList, String.valueOf(value), String.valueOf(time));

        log.info("限流时间段内访问第：{} 次", result.toString());
 
        //lua 脚本返回 "0" 表示超出流量大小，返回1表示没有超出流量大小
        if(StringUtils.equals(result.toString(),"0")){
            //服务降级
            fullback();
            return null;
        }
 
        // 没有限流，直接放行
        return proceedingJoinPoint.proceed();
    }
 
    /**
     * 服务降级方法
     */
    private  void  fullback(){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = null;
        try {
            writer= response.getWriter();
            JSONObject o = new JSONObject();
            o.put("status",500);
            o.put("msg","Redis限流：请求太频繁，请稍后重试！");
            o.put("data",null);
            writer.printf(o.toString()
            );
 
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(writer != null){
                writer.close();
            }
        }
    }
}