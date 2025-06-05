# Spring Boot Template

Template project sử dụng Spring Boot và PostgreSQL.

## Yêu cầu hệ thống

- Java 17 hoặc cao hơn
- Maven
- PostgreSQL

## Cài đặt PostgreSQL

1. Tải và cài đặt PostgreSQL từ [trang chủ PostgreSQL](https://www.postgresql.org/download/)
2. Tạo database mới:
```sql
CREATE DATABASE template_db;
```

## Cấu hình

1. Cập nhật thông tin kết nối database trong `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/template_db
spring.datasource.username=your_username
spring.datasource.password=your_password
```

## Chạy ứng dụng

1. Clone repository
2. Mở terminal và di chuyển vào thư mục project
3. Chạy lệnh:
```bash
mvn spring-boot:run
```

Ứng dụng sẽ chạy tại `http://localhost:8080`

## Cấu trúc project

```
src/main/java/com/example/template/
├── TemplateApplication.java
├── model/
│   └── User.java
├── repository/
├── service/
└── controller/
```

## API Endpoints

API endpoints sẽ được thêm vào sau khi phát triển các tính năng cụ thể. 