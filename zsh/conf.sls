{% for name, user in pillar.get('zsh', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set home = user.get('home', "/home/%s" % name) %}

{{ home }}/.zshenv:
  file.managed:
    - source: salt://zsh/files/zshenv
    - template: jinja
    - context: {{ user }}
    - defaults:
      path: "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/games:/usr/games:$HOME/bin"
      zshenv: ""
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zprofile:
  file.managed:
    - source: salt://zsh/files/zprofile
    - template: jinja
    - context: {{ user }}
    - defaults:
      zprofile: ""
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zshrc:
  file.managed:
    - source: salt://zsh/files/zshrc
    - template: jinja
    - context: {{ user }}
    - defaults:
      theme: "robbyrussell"
      plugins: []
      aliases: {}
      lang: "en_US.UTF-8"
      editor: "nano"
      zshrc: ""
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zlogin:
  file.managed:
    - source: salt://zsh/files/zlogin
    - template: jinja
    - context: {{ user }}
    - defaults:
      zlogin: ""
    - mode: 644
    - require:
      - pkg: zsh

{% endfor %}