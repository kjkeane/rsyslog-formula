# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import rsyslog with context %}

include:
  - {{ sls_service_clean }}

rsyslog-config-clean-file-absent:
  file.absent:
    - name: {{ rsyslog.config }}
    - require:
      - sls: {{ sls_service_clean }}
