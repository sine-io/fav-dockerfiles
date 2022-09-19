

docker run -dit --restart unless-stopped --net=host \
-e CONTROLLER=false \
-e DRIVER=true \
-e DRIVER_PORT=18088 \
-e COSBENCH_PLUGINS="SIO" \
sinecelia/cosbench-sineio:0.4.7.8-ubuntu
