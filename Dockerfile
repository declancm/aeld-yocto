FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    # Poky dependencies
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    file \
    gawk \
    gcc \
    git \
    iputils-ping \
    libacl1 \
    liblz4-tool \
    locales \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-subunit \
    socat \
    texinfo \
    unzip \
    wget \
    xz-utils \
    zstd \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

# Create a non-root user
RUN useradd -s /bin/bash -u 1000 -c "" -m user
USER user

CMD ["/bin/bash"]
