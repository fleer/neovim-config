FROM alpine:latest AS base

RUN apk --no-cache add \
  bash \
  autoconf \
  automake \
  build-base \
  cmake \
  ninja \
  coreutils \
  curl \
  gettext-tiny-dev \
  git \
  libtool \
  pkgconf \
  unzip \
  stow \
  fd  \
  ctags \
  ripgrep \
  fzf \
  python3 \
  python3-dev \
  py3-pip \
  py3-pynvim \
  npm

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git

ARG VERSION=master
RUN cd neovim && git checkout ${VERSION} && make CMAKE_BUILD_TYPE=RelWithDebInfo install

RUN mkdir -p "/root/.config/nvim"

COPY . "/root/.config/nvim/"

# Install packages
RUN nvim --headless "+Lazy! sync" +qa

CMD ["tail", "-f", "/dev/null"]
