# docker build -f dev_bionic.Dockerfile -t dev_bionic .
# docker run -v ~/.ssh:/root/.ssh -it dev_bionic

from ubuntu:18.04

run apt-get update && apt-get upgrade -y
run apt-get install -y \
  apt-utils \
  git \
  software-properties-common \
  wget

# install cmake
run wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.tar.gz \
  && tar -xvf cmake-3.13.4-Linux-x86_64.tar.gz \
  && rm -r cmake-3.13.4-Linux-x86_64/man \
  && cp -r cmake-3.13.4-Linux-x86_64/* /usr/local \
  && rm -r cmake-3.13.4-Linux-x86_64*

# install llvm-7 toolchain
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" \
    | tee /etc/apt/sources.list.d/llvm-toolchain-bionic-7.list \
  && wget -qO - https://apt.llvm.org/llvm-snapshot.gpg.key \
    | apt-key add -
RUN apt-get install -yy \
  clang-7 \
  libc++-7-dev libc++abi-7-dev \
  lld

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-7 100 \
  && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-7 100 \
  && update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld 100

# TODO: dotfiles!

entrypoint /bin/bash
