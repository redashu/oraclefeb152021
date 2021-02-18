FROM tomcat  as  mybuild
MAINTAINER ashutoshh
RUN apt update
RUN apt install maven -y
RUN mkdir  /webapp
WORKDIR  /webapp
ADD . .
RUN mvn clean package 
#  mvn clean package will take jsp app -- build as WAR file under  target directory 


FROM tomcat
MAINTAINER  ashutoshh again 
COPY --from=mybuild  /webapp/target   /usr/local/tomcat/webapps/
EXPOSE 8080


