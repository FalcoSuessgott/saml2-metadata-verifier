#!/bin/sh
#
#   verify SAML2 SP and IDP metadata
#   Author: Tom Morelly 
#   20201014

OPTIONS=--noout

verify() {
    [ ! -f "$1" ] && echo "$1 is no a valid file. Exiting" && exit 1
    
    XML_CATALOG_FILES="./xcatalog/saml-metadata.xml" xmllint --schema saml-2.0-os/saml-schema-metadata-2.0.xsd $OPTIONS "$1"
}

usage() {
  printf "%s\n" "Usage: ${0##*/} [OPTIONS...]"
  printf "\n%s\n" "OPTIONS:"
  printf "  %-25s%s\n" "-f, --file" "path to metadata file"
  exit 0 
}

main() {
    [ $# -eq 0 ] && usage 
    while [ $# -ge 1 ]; do
        case "${1}" in
            -f|--file)
            verify "$2"
            exit 0
            ;;
            -h|--help)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
        ;;
        esac
        shift
    done
}


main "$@"