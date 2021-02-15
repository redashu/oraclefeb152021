FROM oraclelinux:8.3
MAINTAINER  ashutoshh@linux.com , 9509957594
RUN dnf install python3 -y
RUN dnf clean all
RUN mkdir /code
COPY while.py  /code/while.py
WORKDIR  /code
CMD ["python3","while.py"]

