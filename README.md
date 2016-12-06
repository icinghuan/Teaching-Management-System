用jsp+servlet+mysql做的教学管理系统

采用Java平台开发，主要用到的技术有JSP、Servlet、JDBC，数据库为MySQL。具体软件列表如下：
JDK 1.8
MySQL 5.0
Tomcat 7.0
Eclipse


数据库名为web
数据库及网页编码为utf8

Tomcat启动后工程文件访问地址为http://localhost:8080/web

工程目录结构：
	/src/ 源码目录
	/WebContent/跟目录
	/WebContent/WEB-INF/ 站点信息目录
	/WebContent/WEB-INF/web.xml 项目配置
	/WebContent/WEB-INF/lib 库目录
包结构：
	servlet Servlet目录
	model 模型类目录
	util 数据库访问类

教学管理系统
包含的功能有：
1.用户管理
2.学生管理
3.教师管理
4.成绩管理
5.访问权限控制
