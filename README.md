# Nginx Template
With this template you can run multiple domains and point them to each port.

## Notes
This is going to run into the container, out of the docker swarm to create sub urls.

### Example

```
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;

    keepalive_timeout  65;

    server {
        listen      80;
        server_name domain1.com;
        location / {
            proxy_set_header   X-Real-IP $remote_addr;
            proxy_set_header   Host      $http_host;
            proxy_pass         http://127.0.0.1:8081;
        }
        root /var/www/domain1;
    }

    server {
        listen       80;
        server_name domain2.com;
        location / {
            proxy_set_header   X-Real-IP $remote_addr;
            proxy_set_header   Host      $http_host;
            proxy_pass         http://127.0.0.1:8082;
        }
        root /var/www/domain2;
    }
}
```

