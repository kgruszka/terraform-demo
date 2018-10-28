#!/bin/bash -e
ACTION=$1

BOOTSTRAP_PLAN_FILE=bootstrap.tfplan
BACKEND_TEMPLATE_DIR=backend_template
BACKEND_FILE=backend.tf
BACKEND_TEMPLATE_PATH=${BACKEND_TEMPLATE_DIR}/${BACKEND_FILE}

function plan {
    rm ${BACKEND_FILE}    
    terraform init
    terraform plan -out=${BOOTSTRAP_PLAN_FILE}
}

function bootstrap {
    if [[ ! -f ${BOOTSTRAP_PLAN_FILE} ]]; then
        echo "Bootstrap plan not found: ${BOOTSTRAP_PLAN_FILE}"
        echo "Run `./bootstrap.sh plan` first."
        exit 0
    fi
    rm ${BACKEND_FILE}    
    terraform apply ${BOOTSTRAP_PLAN_FILE}
    cp ./${BACKEND_TEMPLATE_PATH} ./${BACKEND_FILE}
    terraform init -force-copy
}

if [[ ${ACTION} == "plan" ]]; then
    plan
    exit 0
fi

if [[ ${ACTION} == "apply" ]]; then
    bootstrap
    exit 0
fi

echo "Specify an action to execute: [plan, apply]"