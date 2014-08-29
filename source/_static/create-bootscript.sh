#!/bin/bash

# Input parameters
INPUT_FILENAME=""
OUTPUT_FILENAME=""
IMAGE_NAME="script"

# Fixed parameters
ARCHITECTURE="arm"
OPERATING_SYSTEM="linux"
IMAGE_TYPE="script"
COMPRESSION_TYPE="none"
LOAD_ADDRESS="10008000"
ENTRY_POINT="0"

function print_usage {
cat << EOF

 This program creates a valid script for u-boot.
 It relies on mkimage program, make sure mkimage binary is properly installed on your machine.

 Usage: ./$1 [OPTIONS]

    OPTION  MANDATORY   DESCRIPTION
    -h      No          Display this help and exit.
    -i      Yes         Specify the input filename.
    -o      Yes         Specify the output filename.
    -n      No          Specify the name to set. If not specified, "script" will be used.

EOF
}

while getopts "hi:o:n:" option
do
    case "${option}" in
        h)
            print_usage `basename $0`
            exit 0
            ;;
        i)
            INPUT_FILENAME=${OPTARG}
            ;;
        o)
            OUTPUT_FILENAME=${OPTARG}
            ;;
        n)
            IMAGE_NAME=${OPTARG}
            ;;
        \?)
            echo "Invalid option -${OPTARG}" >&2
            print_usage `basename $0`
            exit 1
            ;;
        :)
            echo "Option -${OPTARG} requires an argument." >&2
            print_usage `basename $0`
            exit 1
            ;;
    esac
done

if [ -z $INPUT_FILENAME ]
then
    echo "Please, give me the input filename." >&2
    print_usage `basename $0`
    exit 1
fi

if [ -z $OUTPUT_FILENAME ]
then
    echo "Please, give me the output filename." >&2
    print_usage `basename $0`
    exit 1
fi

mkimage -A ${ARCHITECTURE} -O ${OPERATING_SYSTEM} -T ${IMAGE_TYPE} -C ${COMPRESSION_TYPE} -a ${LOAD_ADDRESS} -e ${ENTRY_POINT} -n "${IMAGE_NAME}" -d ${INPUT_FILENAME} ${OUTPUT_FILENAME}
