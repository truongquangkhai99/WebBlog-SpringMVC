## Webiste Blog using Spring MVC and Spring Security
## Đồ án thực tập
## Tác Giả : Trần Thanh Tuấn Vũ
## Email   : tranthanhtuanvu0033@gmail.com
## SDT     : 0325410033

![N|Solid](https://blog.itnavi.com.vn/wp-content/uploads/2021/05/Spring-MVC-l%C3%A0-g%C3%AC-1.jpg)
# Website Blog với các chức năng cơ bản
## Chức năng của quản trị
- **Quản lí bài viết**
- **Quản lí thể loại**
- **Quản lí người dùng**
- **Quản lí Role**
- **Quản lí Bình luận**
## Chức năng của soạn giả
- **Tạo bài viết**
- **Xóa , sửa , quản lí danh sách bài viết của mình**
- **Bình luân vào một bài viết**
## Chức năng của người dùng
- **Bình luận**
- **Xem bài viết**
## Đăng nhập , đăng ký
- **Sử dụng Spring Security**
- **Đăng ký mật khẩu được Hash vào Database**
## Phân quyền
- **Sử dụng Spring Security**
- **Có 3 quyền chính Admin,Write,User** 
## Công nghệ sử dụng
- **Spring Framework 4.3.13.RELEASE**
- **Spring Security 3.2.8.RELEASE**
- **Mysql 8.0.13**
- **Hibernate 4.3.6.Final**
- **Spring Data JPA 1.11.5.RELEASE**
- **Sitemesh 2.4.2**
## Áp dụng API cho trang quản trị
- **Insert,Delete,Update**
## Spring Security
- **Header Security**
- **Session Management -> newSession to prevent Session Fixation**
- **Authorization**
- **Authentication**
## Hướng dẫn tải về và cài đặt
### Eclipse
```sh
tải về  project
Import -> Maven ->  Existing Maven projects
Update Maven
Open Terminal : mvn clean install
Nhấn Ctrl+Shift+R -> Mở JpaConfig.java 
Bỏ comment dòng : properties.setProperty("hibernate.hbm2ddl.auto", "create");
Comment lại dòng : properties.setProperty("hibernate.hbm2ddl.auto", "none");
Sửa lại tài khoản mysql root và mật khẩu nếu cần
Mở Mysql -> tạo database tên springmvc
Tải Tomcat 9 [https://tomcat.apache.org/download-90.cgi]
Mở eclipse -> Run as  -> Apache 9 -> dẫn đến tomcat vừa tải.

Mở mysql
insert into role(code,name) values('ADMIN','Quản trị');
insert into role(code,name) values('USER','Người dùng');
insert into user(username,password,fullname,status)
values('admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','trần thanh tuấn vũ',1);
INSERT INTO user_role(userid,roleid) VALUES (1,1);
Mật khẩu admin : 123456
done
```
