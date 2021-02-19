FROM python  as  ashubuilder 
MAINTAINER  ashutoshh@linux.com
RUN mkdir  /hello
COPY while.py  /hello/
WORKDIR  /hello
RUN chmod +x  while.py


FROM  gcr.io/distroless/python3
COPY --from=ashubuilder /hello /hello
WORKDIR  /hello
CMD ["./while.py"]
