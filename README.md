# nginx-mantlui

Docker container derived from [nginx-consul](nginx-consul) that includes a simple user interface to [Mantl](http://mantl.io/) components.

## Mesos UI

The 0.26 Mesos UI is included in the nginx-mantlui container. The following source files have been modified:

* html/mesos/browse.html
* html/mesos/index.html
* html/mesos/js/app.js
* html/mesos/js/controllers.js
* html/mesos/js/services.js
* html/mesos/pailer.html

The changes are minor &mdash they are just small changes to URLs so that the UI works properly through the proxy.

## Consul UI

The 0.5.2 Consul UI is included in the nginx-mantlui container. The only update is to the `html/consul/application.min.js` file and it is to adjust the path to properly communicate to the Consul API through the proxy. The update was made in [this commit](https://github.com/CiscoCloud/nginx-mantlui/commit/5ab35f3819fb81a1bbb9120d258e1b42dfbbd207) with the following command:

```shell
find . -type f -exec sed -i '' 's/\/v1/\/consul\/v1/g' {} +
```
