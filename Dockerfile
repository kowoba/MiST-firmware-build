FROM debian:stretch
WORKDIR /root/
SHELL ["/bin/bash", "-c"]
RUN (apt-get update; apt-get -y upgrade; apt-get -y install wget git build-essential libgmp-dev libmpfr-dev libmpc-dev sudo) >/dev/null 2>&1
RUN wget -q -O - https://raw.githubusercontent.com/mist-devel/mist-board/master/tools/install_arm-none-eabi-gcc.sh | bash -e
CMD export export PATH=/opt/arm-none-eabi/bin:$PATH &&\
    git clone https://github.com/mist-devel/mist-firmware.git &&\
    make -C mist-firmware &&\
    cp mist-firmware/firmware.upg /mnt/
