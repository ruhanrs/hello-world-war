FROM maven:3.6.1-jdk-8 as maven_build
WORKDIR /mbuild
COPY . .
RUN mvn clean package

FROM ruhanrs/myubuntu:2.0
COPY --from=maven_build /mbuild/target/* /usr/local/tomcat/webapps/
