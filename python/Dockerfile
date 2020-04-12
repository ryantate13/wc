FROM alpine
RUN apk add python3
RUN mkdir /app
COPY wc.py /app/wc.py
ENTRYPOINT ["python3", "/app/wc.py"]