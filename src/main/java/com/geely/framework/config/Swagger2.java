package com.geely.framework.config;//package com.ruoyi.framework.config;
//
//import io.swagger.annotations.ApiOperation;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import springfox.documentation.builders.ApiInfoBuilder;
//import springfox.documentation.builders.PathSelectors;
//import springfox.documentation.builders.RequestHandlerSelectors;
//import springfox.documentation.service.ApiInfo;
//import springfox.documentation.service.Contact;
//import springfox.documentation.spi.DocumentationType;
//import springfox.documentation.spring.web.plugins.Docket;
//import springfox.documentation.swagger2.annotations.EnableSwagger2;
//
///**
// * swagger2
// */
//@Configuration
//@EnableSwagger2
//public class Swagger2 {
//
//    // http://localhost:8088/swagger-ui.html  原路径
//    // http://localhost:8088/doc.html  原路径
//    //配置swagger2核心配置 docket
//    @Bean
//    public Docket createRestApi(){
//
//        return  new Docket(DocumentationType.SWAGGER_2)  //指定api类型为swagger2
//                .apiInfo(apiInfo())                  // 用于定义api文档汇总信息
//                .select()
//                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))  // 指定controller包
//                .paths(PathSelectors.any())                   // 所有controller
//                .build();
//    }
//
//    private ApiInfo apiInfo(){
//
//        return new ApiInfoBuilder()
//                .title("知识管理系统接口API")  //文档也标题
//                .contact(new Contact("imooc ",
//                        "https://www.geely.com" ,"zhu.zhan@geely.com")) //联系人信息
//                .description("专为知识管理系统提供的API文档")  //详细详细
//                .version("1.0.0")     //版本号
//                .termsOfServiceUrl("https://www.geely.com")  //网站地址
//                .build();
//    }
//
//
//}
