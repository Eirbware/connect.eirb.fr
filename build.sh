#!/bin/env /bin/sh
# Stop on first error
set -xe

build_path=${PWD}/.build

kc_data=./keycloak

cas_target_path=${build_path}/keycloak-cas-target
cas_zip_path=${build_path}/keycloak-cas-main.zip
https_patch_path=${build_path}/https_patch.diff
cas_plugin_path=${build_path}/keycloak-cas-main

mkdir -p ${cas_target_path}

# Backup old zip
mv -f "${cas_zip_path}" "${cas_zip_path}.bak" || true
curl -o "${cas_zip_path}" 'https://github.com/RoboJackets/keycloak-cas/archive/refs/heads/main.zip' -f -L

# Backup old sources
mv -f "${cas_plugin_path}" "${cas_plugin_path}.bak" || true

unzip -o -d "${build_path}" "${cas_plugin_path}.zip"
patch $(find "${cas_plugin_path}" | grep UrlHelper.java) ${https_patch_path}

# Remove backup since everything went well
rm -rf "${cas_plugin_path}.zip.bak" "${cas_plugin_path}.bak"

# Backup the last build
mv -f "${cas_target_path}" "${cas_target_path}.bak" || true

# Create a temporary container to build the plugin to ./target
docker build -t build-dep ${build_path}
docker create -it --name build-dep-container build-dep bash
docker cp build-dep-container:/target ${cas_target_path}

# Remove the container once finished
docker rm -f build-dep-container

# Remove last build since the new one succeeded
rm -rf "${cas_target_path}.bak"

mkdir -p ${kc_data}/providers
cp ${cas_target_path}/*.jar ${kc_data}/providers/cas-provider.jar
