zshenv:
  file.managed:
    - name: /etc/zsh/zshenv
    - source: salt://zsh/files/zshenv
    - mode: 644

zprofile:
  file.managed:
    - name: /etc/zsh/zprofile
    - source: salt://zsh/files/zprofile
    - mode: 644

zshrc:
  file.managed:
    - name: /etc/zsh/zshrc
    - source: salt://zsh/files/zshrc
    - mode: 644

zlogin:
  file.managed:
    - name: /etc/zsh/zlogin
    - source: salt://zsh/files/zlogin
    - mode: 644