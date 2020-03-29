![](https://gitlab.com/eight-matter-clients/petdepot-multiservices-software/-/raw/master/assets/Nginx-banner.png)

# Notes
This is going to run into the container, out of the docker swarm to create sub urls.

### Examples
- App citas `localhost/citas/`.
- App peluqueria `localhost/peluqueria/`.
- API `localhost/api/v1/`.

```
server {
    listen       80;

    ## Citas app
    location ~ ^/citas/(.*)$ {
        proxy_pass   http://192.168.99.106:3000/$1$is_args$args;
    }

    ## Peluqueria app
    location ~ ^/peluqueria/(.*)$ {
        proxy_pass   http://192.168.99.106:3010/$1$is_args$args;
    }

    ## API
    location ~ ^/api/v1/(.*)$ {
        proxy_pass   http://192.168.99.106:3000/$1$is_args$args;
    }

}
```

This way we can run multiple aplications in the same server using docker swarm. Fuck with Kubernetes (for now).


## Authors
* **Christopher Q.** - *Initial Work* .
* **Jose C.** - *Initial Work* .

## Copyright
All licenses in this repository are copyrighted by their respective authors.
