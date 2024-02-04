# neovim-config

My Neovim config for daily development

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
