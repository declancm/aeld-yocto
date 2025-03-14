#!/bin/bash

source poky/oe-init-build-env

add_conf() {
    local conf_content="${1}"
    local conf_file="conf/local.conf"

    if ! grep -q "${conf_content}" "${conf_file}"; then
        echo "Adding '${conf_content}' to ${conf_file}"
        echo "${conf_content}" >> "${conf_file}"
    else
        echo "'${conf_content}' already in ${conf_file}"
    fi
}

add_layer() {
    local layer_path="${1}"
    local layer_name="$(basename "${layer_path}")"

    if ! bitbake-layers show-layers | grep -q "${layer_name}"; then
        echo "Adding '${layer_name}' layer"
        bitbake-layers add-layer "${layer_path}"
    else
        echo "'${layer_name}' layer already added"
    fi
}

add_layer ../meta-raspberrypi
add_conf 'MACHINE = "raspberrypi5"'
add_conf 'LICENSE_FLAGS_ACCEPTED += "synaptics-killswitch"'

bitbake core-image-base
