FROM alpine as build
RUN apk add --no-cache python3 python3-dev gcc libc-dev chrpath
RUN pip3 install nuitka
RUN mkdir /app
COPY wc.py /app/wc.py
WORKDIR /app
RUN nuitka3 --standalone wc.py

FROM alpine
COPY --from=build /app/wc.dist /app
ENTRYPOINT ["/app/wc"]