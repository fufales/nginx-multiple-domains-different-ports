FROM nginx:alpine

# Copy
COPY ./dev-env/nginx/default.conf /etc/nginx/conf.d/default.conf

# App Bunddle
EXPOSE 80