#sudo docker run -it coldcard /bin/bash
xhost + && \
sudo docker run \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY -it \
coldcard /bin/bash \
&& xhost -