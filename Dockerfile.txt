# Giai đoạn 1: Dùng Maven để biên dịch mã nguồn thành file .war
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Giai đoạn 2: Đưa file .war vào máy chủ Tomcat
FROM tomcat:9.0-jre8-alpine
# Xóa các trang mặc định của Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy file .war vừa tạo đổi tên thành ROOT.war để web chạy ở tên miền gốc (/)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]