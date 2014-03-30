oh_my_zsh:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: /etc/zsh/oh-my-zsh
  file.directory:
    - name: /etc/zsh/oh-my-zsh
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - mode
    - require:
      - git: oh_my_zsh