# neovim-config

My Neovim config for daily development

## Installation

Clone the repository to `.config/nvim`:

```shell
cd ~/.config/
git clone git@github.com:fleer/neovim-config.git nvim
```

## Docker

Execute Neovim in a Docker container.
Build the container with

```shell
docker build . -t neovim
```

Start Neovim in container via

```shell
docker run --rm -it neovim /bin/bash
```

and then execute the `nvim` command.
