FROM alpine
RUN apk add --no-cache nodejs
RUN mkdir /app
COPY wc.js /app/wc.js
ENTRYPOINT ["node", "/app/wc.js"]