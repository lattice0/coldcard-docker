#sudo docker run -it coldcard /bin/bash
xhost + && \
sudo docker run \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $PWD/microSD:/home/project/firmware/unix/work/MicroSD \
-e DISPLAY=unix$DISPLAY -it \
coldcard /bin/bash \
&& xhost -