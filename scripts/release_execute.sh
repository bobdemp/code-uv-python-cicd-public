#!/bin/bash
#####################################################
#####################################################
#
# This is a script to execute release scripts
#
#####################################################
#####################################################

set -x

#####################################################
#
# function(s)
#
#####################################################

function log_output()
{
    echo ""
    echo "***********************************"
    echo "$1"
    echo "***********************************"
    echo ""
}

#####################################################
#
# function main
#
#####################################################

function main()
{
    echo ""
    echo "***********************************"
    echo "Started execute_release.sh"
    echo "***********************************"
    echo ""
    echo "Script executed from: $(pwd)"
    echo ""
    echo "----------------"
    date
    echo "----------------"
    echo ""
    echo "***********************************"
    echo "Checking environment variables"
    echo "***********************************"
    echo ""
    echo "TAG                           - [$GITHUB_REF_NAME]"
    echo "ENV_TIER                      - [$ENV_TIER]"
    echo ""

    # Check Environment variables

    if [ -z "$GITHUB_REF_NAME" ]
    then
        log_output "Error. \$GITHUB_REF_NAME is not defined"
        exit 1
    fi

    # Calculate variables

    if [ "$(echo "$ENV_TIER" | tr '[:upper:]' '[:lower:]')" == "testing" ]; then

        export CLIENT_ENV="TEST"

    elif [ "$(echo "$ENV_TIER" | tr '[:upper:]' '[:lower:]')" == "production" ]; then

        export CLIENT_ENV="PROD"

    else

        log_output "Error. CLIENT_ENV Unknown"
        exit 1

    fi

    CLIENT_NOTEBOOK_VERSION=$(echo "$GITHUB_REF_NAME" | sed 's/^[^-]*-//; s/\./_/g')

    echo "CLIENT_ENV                    - [$CLIENT_ENV]"
    echo "CLIENT_NOTEBOOK_VERSION       - [$CLIENT_NOTEBOOK_VERSION]"
    echo ""

    # Deploy Notebook

    echo "Starting Deploy Notebook"
    ### Something runs
    echo "Completed Deploy Notebook"

    echo ""
    echo "----------------"
    date
    echo "----------------"
    echo ""
    echo "***********************************"
    echo "Completed execute_release.sh"
    echo "***********************************"
    echo ""

}

#####################################################
#
# Entry point
#
#####################################################

main
