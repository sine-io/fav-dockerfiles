# cosbench-ehualu

This image provides an easy way to run [COSbench](https://github.com/kisscelia/cosbench-ehualu.git) with the [ess, essv2, gdas] backend support.

## How to use this image

By default, COSbench starts as a controller and a driver to allow you to start
a bench.

Environment variables available are:  
- `DRIVER`: Starts as a COSbench driver (Default to `true`)
- `CONTROLLER`: Starts as a COSbench controller (Default to `true`)
- `DRIVERS`: Comma separated list of COSbench drivers to be used by the controller
 (Default to `http://127.0.0.1:18088/driver`)
- `COSBENCH_PLUGINS`: Comma separated list of COSbench OSGI plugins to load. The more you add, the slower it is to start (Default to `ESS`. Available values: `ESS,ESSV2,GDAS,OPENIO,CDMI,SWIFT,SCALITY,S3,CEPH,AMPLI`)


Start a controller/injector COSbench container:  
```console
# docker run -dit --restart unless-stopped --net=host \
-e CONTROLLER=true \
-e DRIVER=true \
-e DRIVERS="http://192.168.0.1:18088/driver,http://192.168.0.2:18088/driver" \
-e COSBENCH_PLUGINS="ESS,OPENIO,SWIFT,S3" \
sine/cosbench-ehualu
```
Then you can access the COSbench Web Interface through `http://192.168.0.1:19088/controller/index.html`

Add one or more injector
```console
# docker run -dit --restart unless-stopped --net=host \
-e CONTROLLER=false \
-e DRIVER=true \
-e DRIVERS="http://192.168.0.2:18088/driver" \
-e COSBENCH_PLUGINS="ESS,OPENIO,SWIFT,S3" \
sine/cosbench-ehualu
```

## Define COSbench Workloads

- Using the ESS API:
You need to start your controller with the `ESS` support.
 * Authentication
  * Type: `None`
 * Storage
  * Type: `ess`
  * Configuration: `accesskey=<accesskey>;secretkey=<scretkey>;proxyhost=<proxyhost>;proxyport=<proxyport>;endpoint=<endpoint>;no_verify_ssl=true;path_style_access=true`

- Using the GDAS API:
You need to start your controller with the `GDAS` support.
 * Authentication
  * Type: `None`
 * Storage
  * Type: `gdas`
  * Configuration: `accesskey=<accesskey>;secretkey=<scretkey>;proxyhost=<proxyhost>;proxyport=<proxyport>;endpoint=<endpoint>;no_verify_ssl=true;path_style_access=true`

- Using the OpenIO SDS Java API
You need to start your controller with the `OPENIO` support.
* Authentication
 * Type: `None`
* Storage
 * Type: `openio`
 * Configuration: `ns=<NAMESPACE>;account=<ACCOUNT>;proxyd-url=<OIOPROXY_URL>;ecd-url=<ECD_URL>`

- Using the Openstack Swift API with Keystone:
You need to start your controller with the `SWIFT` support.
 * Authentication
  * Type: `keystone`
  * Configuration: `username=<USERNAME>;password=<PASSWORD>;tenant_name=<TENANT>;auth_url=http://<KEYSTONE_URL>/v2.0;service=<SWIFT_SERVICE>`
 * Storage
  * Type: `swift`
  * Configuration: `storage_url=http://<SWIFT_PROXY_URL>/auth/v1.0`

- Using the AWS S3 API:
You need to start your controller with the `S3` support.
 * Authentication
  * Type: `None`
 * Storage
  * Type: `s3`
  * Configuration: `accesskey=<accesskey>;secretkey=<scretkey>;proxyhost=<proxyhost>;proxyport=<proxyport>;endpoint=<endpoint>`