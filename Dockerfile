FROM alpine:latest
RUN apk add --no-cache bash
WORKDIR /app
COPY fibonacci-series.sh
RUN chmod +X fibonacci-series.sh
ENTRYPOINT ["./fibonacci-series.sh"]

