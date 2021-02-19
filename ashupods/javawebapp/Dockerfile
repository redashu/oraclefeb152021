FROM tomcat
# standard tomcat image from Docker hub
MAINTAINER ashutoshh@linux.com
WORKDIR  /usr/local/tomcat/webapps
RUN mkdir ashuapp
WORKDIR ashuapp
COPY myapp  .
RUN chmod 755 . -R
# is optional to fix permission issues in JAVA backend file
EXPOSE 8080

# Note :- Here i am not gonna use CMD /Entrypoint 
# so FROM image parent process will be inherited 
