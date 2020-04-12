FROM alpine:3.11
RUN apk add --no-cache php
COPY wc.php /wc.php
ENTRYPOINT ["php", "/wc.php"]