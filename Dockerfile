FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y --no-install-recommends install \
        build-essential \
        git \
        git-core \
        git-lfs \
        python3-dbg \
        python3-dev \
        python3-pip \
        python3-pexpect \
        python3-git \
        python3-jinja2 \
        python3-subunit \
        vim \
        cmake \
        gcc-multilib \
        g++-multilib \
        software-properties-common \
        language-pack-en-base \
        wget \
        diffstat \
        chrpath \
        cpio \
        gawk \
        file \
        zstd \
        liblz4-tool \
        unzip && \
    apt-get -y clean

RUN git config --global --add safe.directory /workspace

RUN cd / && \
    git clone git://git.openembedded.org/bitbake
ENV PATH="${PATH}:/bitbake/bin"
ENV PYTHONPATH="${PYTHONPATH}:/bitbake/lib"
RUN pip install -r bitbake/toaster-requirements.txt

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
    tar -xf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
ENV PATH="/gcc-arm-none-eabi-10.3-2021.10/bin:${PATH}"

RUN cd / && mkdir thirdparty && cd thirdparty && git clone -b kirkstone git://git.yoctoproject.org/poky.git

CMD ["/bin/bash"]

WORKDIR /workspace/
