FROM alpine
RUN apk add nodejs
RUN mkdir /app
COPY wc.js /app/wc.js
ENTRYPOINT ["node", "/app/wc.js"]