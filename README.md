# nginx-mantlui

Docker image derived from [nginx-consul](nginx-consul) that includes a simple user interface to [Mantl](http://mantl.io/) components.

![Screenshot](screenshot.png)

## Setup

This image is integrated tightly with Mantl clusters and is not likely to be useful outside of one (except, perhaps, as an example of using nginx-consul). In Mantl, it is configured to run on all control nodes and, based on Consul service discovery, consolidates various control UIs and APIs into a single place.

## User Interfaces

### Mesos UI (/mesos)

The 0.26 Mesos UI is included in the nginx-mantlui container. The following source files have been modified:

* html/mesos/browse.html
* html/mesos/index.html
* html/mesos/js/app.js
* html/mesos/js/controllers.js
* html/mesos/js/services.js
* html/mesos/pailer.html

The changes are minor &mdash they are just small changes to URLs so that the UI works properly through the proxy.

The proxy ensures that you are always connected to the UI on the leading Mesos master. This functionality depends on [mesos-consul](https://github.com/CiscoCloud/mesos-consul). Also, every Mesos agent is proxied so that the agent APIs are reachable.

### Marathon UI and API (/marathon)

The nginx configuration just proxies requests to the underlying Marathon UI and API.

### Consul UI (/consul)

The 0.5.2 Consul UI is included in the nginx-mantlui container. The only update is to the `html/consul/application.min.js` file and it is to adjust the path to properly communicate to the Consul API through the proxy. The update was made in [this commit](https://github.com/CiscoCloud/nginx-mantlui/commit/5ab35f3819fb81a1bbb9120d258e1b42dfbbd207) with the following command:

```shell
find . -type f -exec sed -i '' 's/\/v1/\/consul\/v1/g' {} +
```

### Chronos UI (/chronos)

The nginx configuration just proxies requests to the underlying Marathon UI and API.

### Mantl API (/api)

The nginx configuration just proxies requests to [mantl-api](https://github.com/CiscoCloud/mantl-api) running in the cluster.

### Traefik (/traefik)

A couple of files in the [Traefik](https://github.com/emilevauge/traefik) UI have been modified so that API requests are routed correctly (`/traefik/api` instead of `/api`).
