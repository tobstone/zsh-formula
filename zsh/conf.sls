{% for name, user in pillar.get('zsh', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}}
{%- set home = user.get('home', "/home/%s" % name) -%}

zshenv:
  file.managed:
    - name: {{ home }}/.zshenv
    - source: salt://zsh/files/zshenv
    - template: jinja
    - context: {{ user }}
    - mode: 644

zprofile:
  file.managed:
    - name: {{ home }}/.zprofile
    - source: salt://zsh/files/zprofile
    - template: jinja
    - context: {{ user }}
    - mode: 644

zshrc:
  file.managed:
    - name: {{ home }}/.zshrc
    - source: salt://zsh/files/zshrc
    - template: jinja
    - context: {{ user }}
    - mode: 644

zlogin:
  file.managed:
    - name: {{ home }}/.zlogin
    - source: salt://zsh/files/zlogin
    - template: jinja
    - context: {{ user }}
    - mode: 644

{% endfor %}