FROM java
# meaning it will pull java docker image from docker HUB if not present 
MAINTAINER  ashutoshh@linux.com
# optional field -- Info about dockerfile writer 
RUN  mkdir  /codes
# is for running some command inside container 
#  and this changes will be reflected in new docker image
COPY  test.java  /codes/test.java 
# is to copy from client machine to docker image that will be created 
# make sure code & Dockerfile both are at same location 
WORKDIR   /codes
# changing location permanently in newly created docker image
#  its similar to cd command in LInux other environment 
RUN  javac  test.java
# compiling test.java for all error checking purpose 
CMD  ["java","myclass"]
# CMD is for default parent process if not given by user 

