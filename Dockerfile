FROM nginx:alpine
ARG BREAK_HEALTH=false
ARG BREAK_CONTENT=false
COPY index.html /usr/share/nginx/html/index.html
COPY health.html /usr/share/nginx/html/health.html
RUN if [ "$BREAK_HEALTH" = "true" ]; then rm -f /usr/share/nginx/html/health.html; fi
RUN if [ "$BREAK_CONTENT" = "true" ]; then sed -i 's/data-item//g' /usr/share/nginx/html/index.html; fi
EXPOSE 80