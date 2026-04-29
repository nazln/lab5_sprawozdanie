FROM scratch AS base
ADD alpine-minirootfs-3.21.3-x86_64.tar.gz /
ARG VERSION=1.0.0
ENV APP_VERSION=${VERSION}
WORKDIR /app
COPY index.html .
COPY start.sh .
RUN sed -i "s/APP_VERSION/${VERSION}/g" /app/index.html && \
    chmod +x /app/start.sh

FROM nginx:alpine
ARG VERSION=1.0.0
ENV APP_VERSION=${VERSION}
COPY --from=base /app/index.html /usr/share/nginx/html/index.html
COPY --from=base /app/start.sh /start.sh
RUN chmod +x /start.sh && \
    apk add --no-cache curl
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["/start.sh"]