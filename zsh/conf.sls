{% for name, user in pillar.get('zsh', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}}
{%- set home = user.get('home', "/home/%s" % name) %}

{{ home }}/.zshenv:
  file.managed:
    - source: salt://zsh/files/zshenv
    - template: jinja
    - context: {{ user }}
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zprofile:
  file.managed:
    - source: salt://zsh/files/zprofile
    - template: jinja
    - context: {{ user }}
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zshrc:
  file.managed:
    - source: salt://zsh/files/zshrc
    - template: jinja
    - context: {{ user }}
    - mode: 644
    - require:
      - pkg: zsh

{{ home }}/.zlogin:
  file.managed:
    - source: salt://zsh/files/zlogin
    - template: jinja
    - context: {{ user }}
    - mode: 644
    - require:
      - pkg: zsh

{% endfor %}