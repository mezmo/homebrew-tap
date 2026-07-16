# Test image for exercising this tap's formulae on Linux. Built on a current
# Ubuntu (glibc 2.39) so released AURA binaries run under `brew test`, with
# Homebrew (Linuxbrew) installed for a non-root user — brew refuses to run as
# root. Homebrew on Linux requires a C toolchain even to install bottles and to
# build its developer gems for `brew style`/`audit`; gcc + make + libc headers
# is the minimal set (no g++/dpkg-dev, unlike build-essential).
FROM ubuntu:24.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      gcc make libc6-dev procps curl file git ca-certificates sudo \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash linuxbrew \
 && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/linuxbrew

USER linuxbrew
RUN NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
