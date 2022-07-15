

docker run -dit --restart unless-stopped --net=host \
-e CONTROLLER=false \
-e DRIVER=true \
-e DRIVER_PORT=18288 \
-e COSBENCH_PLUGINS="ESS" \
sinecelia/cosbench-ehualu:0.4.7.8-alpine
