package com.geely.framework.aspectj.lang.annotation;

import java.lang.annotation.*;

/**
 * @author 占助
 * @date 2020/7/1 15:46
 * @description ${自定义限流注解}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */

@Target(value = ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RedisRateLimiter {
    //往令牌桶放入令牌的速率
    double value() default  Double.MAX_VALUE;
    //获取令牌的超时时间
    double limit() default  Double.MAX_VALUE;
}
