# Ansible role - mto79.transip.dns

## Table of Contents

- [Ansible role - mto79.transip.dns](#ansible-role---mto79transipdns)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Role variables](#role-variables)
    - [Setup](#setup)
    - [Upstream](#upstream)
  - [Example Playbook](#example-playbook)

## [Requirements](#requirements)

- The minimum version of Ansible required is 2.12.0.
- The minimum version of Jinja template 2.11.3

## [Role variables](#role-variables)

### Setup

| Variable | Type | Default | Description |
| -------- | ---- | ------- | ----------- |

### Upstream

| Variable | Type | Default | Description |
| -------- | ---- | ------- | ----------- |

## [Example Playbook](#example-playbook)

Refer to the following example:

```yaml
    - hosts: "servers"
      roles:
        - role: "mto79.transip.dns"
          vars:
            __role_action: "setup"
          tags: ['transip', 'transip-dns']
```
