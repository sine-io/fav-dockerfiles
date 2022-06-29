

docker run -dit --restart unless-stopped --net=host --name cosbench-controller \
-e CONTROLLER=true \
-e DRIVER=false \
-e DRIVERS="http://172.38.30.133:18088/driver,http://172.38.30.133:18188/driver" \
sinecelia/cosbench-ehualu:0.4.7.8-ubuntu
