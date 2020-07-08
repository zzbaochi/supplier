# supplier
springboot vue 前后端分离项目。Java实现的权限管理，用户，角色，部门，等常用的权限架构实现模板，数据库是mysql。实现限流和敏感词过滤

部署步骤：

1、在MySQL数据新建数据库，执行sql里面的脚本，

2、更新maven，启动项目

项目说明：

1、前端和后端代码可以参考，https://gitee.com/y_project/RuoYi-Vue

2、后端代码也是参考前端大神开源的框架，自己整合了，实现限流，分布式id生产、敏感词过滤、使用redis分布式锁实现按照某个规则生成编号等等 ：

3、实现限流：参考地址：https://blog.csdn.net/u014373554/article/details/106799201

4、实现敏感词过滤：参考地址：https://blog.csdn.net/u014373554/article/details/107182944

5、基于Redis的redisson框架实现分布式单号，按照有序生成分布式ID（自定义规则生成）参数地址：https://blog.csdn.net/u014373554/article/details/107076636

