include:
  - zsh.oh-my-zsh
  - zsh.conf

zsh:
  pkg.installed:
    - require_in:
      - git: oh_my_zsh
      - file: zshenv
      - file: zprofile
      - file: zshrc
      - file: zlogin