#!/bin/bash

COLLECTION_NAME=$(grep 'name: \w*' galaxy.yml | awk '{print $2}')

echo "Enter role name: "
read ROLE_NAME

mkdir -p ./roles/$ROLE_NAME

git clone --depth 1 --branch main https://gitlab.proxy.nl/mst/ansible/templates/ansible_role_template roles/$ROLE_NAME

cd ./roles/$ROLE_NAME

rm -rf .git .gitignore .pre-commit-config.yaml

ROLE_IN_COLLECTION="true" bash replace.sh $ROLE_NAME

cd ../../

cat > playbooks/${ROLE_NAME}.yml << EOF
---
- name: Run the proxyservices.${COLLECTION_NAME}.${ROLE_NAME} role.
  hosts: '{{ target | default("${ROLE_NAME}") }}'
  roles:
    - { role: proxyservices.${COLLECTION_NAME}.${ROLE_NAME}, tags: ['${COLLECTION_NAME}', '${ROLE_NAME}']}

...
EOF
