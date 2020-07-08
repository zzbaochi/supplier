//package com.geely.framework.serial;
//
//import com.geely.common.utils.StringUtils;
//import com.geely.framework.redis.RedisCache;
//import com.geely.project.supplier.mapper.BUserMapper;
//import org.redisson.api.RLock;
//import org.redisson.api.RedissonClient;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import java.util.concurrent.TimeUnit;
//
//import static jodd.util.ThreadUtil.sleep;
//
///**
// * @author 占助
// * @date 2020/6/29 17:09
// * @description ${类的描述}
// * @Copyright © 吉利汽车
// * @Version: 1.0
// */
//@Component
//public class FormNoSerialUtil {
//
//    @Autowired
//    private RedisCache redisCache;
//    @Autowired
//    private BUserMapper bUserMapper;
//
//    @Autowired
//    private RedissonClient redissonClient;
//
//    //用户编码当前最大值，存储在redis中的key
//    private static final String CURRENT_MAX_USER_CODE_KEY = "CURRENT_MAX_USER_CODE_KEY";
//    //用户编码前缀
//    private final static String PRE_GROUP_CODE = FormNoTypeEnum.USER_ORDER.getPrefix();
//    //用户编码初始值，格式：前缀+8000000开始的流水，如：w8000001
//    private static final String INIT_USER_CODE = PRE_GROUP_CODE+"0000000";
//    //分布式锁的锁定时长，单位秒
//    private static final int LOCK_TIME = 5;
//    //分布式锁的key
//    private static final String LOCK_KEY = "USER_CODE_INC_LOCK";
//
//    //缓存初始化
//    @PostConstruct
//    public void initCurrentMaxUserCode(){
//        //初始化获取数据库中最大编码值
//        String currentMaxUserCode = bUserMapper.getUserNumberMax();
//        //如果为空，则设置为初始值
//        if(StringUtils.isBlank(currentMaxUserCode)){
//            currentMaxUserCode = INIT_USER_CODE;
//        }
//        redisCache.setCacheObject(CURRENT_MAX_USER_CODE_KEY, currentMaxUserCode,0);
//    }
//
//    public String  getNewMax(long timeOut, TimeUnit timeUnit){
//        String newMaxValue = null;
//        if(timeUnit == null){
//            timeUnit = TimeUnit.SECONDS;
//        }
//        RLock lock = redissonClient.getLock(LOCK_KEY);
//        try {
//            //lock.lock(5, TimeUnit.SECONDS);
//            boolean tryLock = lock.tryLock(3, 5, timeUnit);
//            if(tryLock){
//                String currentMaxValue =  redisCache.getCacheObject(CURRENT_MAX_USER_CODE_KEY); //获取当前最大编码值
//                //如果redis中该值丢失，重新执行初始化
//                if(StringUtils.isBlank(currentMaxValue)){
//                    initCurrentMaxUserCode();
//                    currentMaxValue = redisCache.getCacheObject(CURRENT_MAX_USER_CODE_KEY);
//                }
//                //3、将最大值加1，获取新的最大值
//                int currentMaxNum = Integer.parseInt(currentMaxValue.substring(currentMaxValue.indexOf(PRE_GROUP_CODE)+1));
//                newMaxValue = PRE_GROUP_CODE + (currentMaxNum + 1);
//                //4、将新的最大值同步到redis缓存
//                redisCache.setCacheObject(CURRENT_MAX_USER_CODE_KEY, newMaxValue,0);
//
//            }else {
//                System.out.println("--未获取到锁");
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }finally {
//            System.out.println("释放锁！");
//            lock.unlock(); //释放锁
//
//        }
//        return newMaxValue;
//
//    }
//
//}
