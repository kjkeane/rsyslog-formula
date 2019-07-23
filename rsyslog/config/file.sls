# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import rsyslog with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

rsyslog-config-file-file-managed:
  file.managed:
    - name: {{ rsyslog.config }}
    - source: {{ files_switch(['rsyslog.conf', 'rsyslog.conf.jinja'],
                              lookup='rsyslog-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: root
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        rsyslog: {{ rsyslog | json }}
