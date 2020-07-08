package com.geely.framework.aspectj;


import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

/**
 * @program: gmes-boxcar->HttpAspect
 * @description: 在控制器方法被调用的过程中处理一些额外的工作，比如打印请求日志信息
 * @author: Zhu.Zhan
 * @create: 2019/11/19 14:11
 **/
@Slf4j
@Aspect
@Component
@Order(1)
public class HttpAspect implements ThrowsAdvice {

    @Pointcut("execution(public * com.geely.project.*.controller.*.*(..))")
    public void httpCut() {
    }
    @Before("httpCut()")
    public void before(JoinPoint joinPoint) {
        //String uuid = String.valueOf(UUID.randomUUID()).replaceAll("-", "");
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        log.info(
                "===========================================================================================================================================");
        //Enumeration<String> enums = request.getHeaderNames();
        // 记录下请求内容

        log.info("HTTP URL : " + request.getRequestURL().toString());
        log.info("HTTP ARGS : " + Arrays.toString(joinPoint.getArgs()));

    }

    @AfterReturning(value = "httpCut()", returning = "returnValue")
    public void after(Object returnValue) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletResponse response = attributes.getResponse();
        // 记录下请求结果状态

        log.info("HTTP STATUS : " + response.getStatus());
        log.info("HTTP RETURN : " + JSONObject.fromObject(returnValue).toString());

//		log.info(
//				"===========================================================================================================================================");

    /*    TestDataDO data = (TestDataDO) testData.get();
        data.setReturnValue(JSONObject.fromObject(returnValue).toString());
        data.setTestResult(true);
        data.setFailMsg("详情见返回值");
        cache.testDataMap.put(data.getUuid(), data);
        testData.remove();

        MDC.remove(REQUEST_ID);*/
    }


    @Around(value = "httpCut()")
    public Object around(ProceedingJoinPoint joinPoint) {
        long start = System.currentTimeMillis();
        Object obj = null;
        try {
            obj = joinPoint.proceed();
        } catch (Throwable throwable) {
            log.error("\t统计方法执行时间\t统计失败\t" + throwable.getMessage() + "\n", throwable);
        }
        long end = System.currentTimeMillis();
        log.info("HTTP ELAPSE : " + (end - start) + " ms");
        return obj;
    }

    @AfterThrowing(value = "httpCut()", throwing = "ex")
    public void afterThrowing(JoinPoint joinPoint, Exception ex) {
        log.error("EXEP METHOD : " + joinPoint.getSignature().getName());
        log.error("EXEP MESSAGE : " + ex.getMessage() + "\n", ex);
        log.error(
                "===========================================================================================================================================");

    }


}
