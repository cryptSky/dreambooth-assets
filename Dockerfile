FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
LABEL repository="xformers-builder"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y bash \
                   build-essential \
                   vim \
                   git \
                   git-lfs \
                   wget \
                   ca-certificates \
                   python3.8 \
                   python3-pip \
                   python3.8-venv && \
    rm -rf /var/lib/apt/lists

# make sure to use venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN python3 -m pip install --no-cache-dir \
        torch \
        torchvision \
        torchaudio \
        --extra-index-url https://download.pytorch.org/whl/cu117

RUN python3 -m pip install wheel
RUN python3 -m pip install ninja

RUN git clone https://github.com/facebookresearch/xformers
WORKDIR /xformers
RUN git checkout 1d31a3ac3b11f40fde7f00aa64debb0fd4d6f376 -b v0.0.14
RUN git submodule update --init --recursive

CMD ["/bin/bash"]
