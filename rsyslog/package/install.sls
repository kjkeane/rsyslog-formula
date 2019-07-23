# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import rsyslog with context %}

rsyslog-package-install-pkg-installed:
  pkg.installed:
    - name: {{ rsyslog.pkg.name }}

{%- if rsyslog.modules is defined %}
{%- for module in rsyslog.module_pkgs %}
rsyslog-module-install-{{ module }}:
  pkg.installed:
    - name: {{ module }}
{%- endfor %}
{%- endif %}

