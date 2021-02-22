FROM ubuntu:bionic

RUN apt-get update && apt-get install -y build-essential make \
python3-dev python3-virtualenv autogen xterm libsdl2-dev \
gcc-arm-none-eabi libtool git python3-pip libudev-dev libusb-1.0-0-dev \
python3-sdl2 autoconf libffi-dev

WORKDIR /home/project

RUN git clone --recursive https://github.com/Coldcard/firmware.git

RUN cd firmware \
&& git submodule update --init\
&& pip3 install -r requirements.txt

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN echo "Applying corrections" \
&& sed -i '29 s/^/        #/' /home/project/firmware/unix/frozen-modules/pyb.py \
&& sed -i "31,32 s/# *//" /home/project/firmware/unix/frozen-modules/pyb.py \
&& sed -i '1 i\import os'  /home/project/firmware/unix/frozen-modules/ffilib.py \
&& sed -i '/if sys.platform == "linux":/c\        if sys.platform == "linux" or os.getenv("COLDCARD_LINUX")=="1":' /home/project/firmware/unix/frozen-modules/ffilib.py \
&& cat /home/project/firmware/unix/frozen-modules/ffilib.py

RUN cd firmware/unix; make setup && make

ENV COLDCARD_LINUX=1

COPY docker_init.sh /home/project/docker_init.sh
COPY docker_init_firstrun.sh /home/project/docker_init_firstrun.sh