# Isenguard NVM

This is a simplistic nvm distro based on Kickstart NVM.

## Requirements

- [Nerd fonts](https://www.nerdfonts.com/) install using your OS package manager
- Make your terminal use the nerdfonts

## How to install

- Install Isenguard NVM with git

```bash
git clone git@github.com:graned/isenguard.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/isenguard
```

This will install the project in the `.config/` folder under folder `isenguard`

- Add alias in your zsh (Optional)

```bash
alias isenguard='NVIM_APPNAME="isn" nvm'
```
