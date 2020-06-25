# Dashboard service

This is the dockerized version of Hasicorp's
[Dashboard service](https://github.com/hashicorp/demo-consul-101/tree/master/services/dashboard-service)
used as an example to play around with Consul and Envoy.

## Run

Simply run the following:

```sh
docker run -it --rm -p 81:80 pasdam/dashboard-service:latest
```

The service will be available at [localhost:81](http://localhost:81), and it
will show the counter value if the backend service is available.
