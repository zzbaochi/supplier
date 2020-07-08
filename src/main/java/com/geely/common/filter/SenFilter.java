package com.geely.common.filter;

import com.alibaba.fastjson.JSON;
import com.geely.common.utils.sen.SensitiveFilter;
import com.geely.framework.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * @author 占助
 * @date 2020/7/6 14:32
 * @description ${ 敏感字过滤器}
 * @Copyright © 吉利汽车
 * @Version: 1.0
 */
public class SenFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        boolean flag = true;
        SensitiveFilter filter = SensitiveFilter.DEFAULT;
        if (httpServletRequest.getMethod().equals(RequestMethod.GET.name())) {
            //获取前端传递的所有参数名的枚举
            Enumeration pNames = httpServletRequest.getParameterNames();
            //遍历枚举
            while(pNames.hasMoreElements()){
                //获取参数名
                String name=(String)pNames.nextElement();
                //获取参数值
                String value =httpServletRequest.getParameter(name);
                //对参数值进行敏感词处理,并重新设置到request
                String str = filter.filter(value, '*');
                if(value != str){
                    servletResponse.setContentType("application/json; charset=UTF-8");
                    PrintWriter out = servletResponse.getWriter();
                    out.println(JSON.toJSONString(AjaxResult.error("参数包含敏感信息")));
                    out.flush();
                    flag = false;
                    break;
                }
                httpServletRequest.setAttribute(name,str);
            }
            if(flag){
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } else if (httpServletRequest.getMethod().equals(RequestMethod.POST.name())) {
        SenRequestWrapper senRequestWrapper = new SenRequestWrapper(httpServletRequest);
        if(senRequestWrapper == null) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            String body = senRequestWrapper.getBody();
            String filted = filter.filter(body, '*');
            if (body != filted) {
                servletResponse.setContentType("application/json; charset=UTF-8");
                PrintWriter out = servletResponse.getWriter();
                out.println(JSON.toJSONString(AjaxResult.error("参数包含敏感信息")));
                out.flush();
            } else {
                filterChain.doFilter(senRequestWrapper, servletResponse);
            }
        }
    } else {
        filterChain.doFilter(servletRequest, servletResponse);
    }


    }

    @Override
    public void destroy() {

    }
}
