# NvChad Configs

## Installation
### Delete all neovim data
> [!WARNING]  
> This is destructive action. Backup your existing configs first

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.config/nvim
```
### Install NvChad
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
> [!Note]
> Press `n` when asked to setup example config

### Add custom configs
```bash
cd ~/.config/nvim/lua/custom
git clone git@github.com:thegeekywanderer/nvchad-config.git .
```
