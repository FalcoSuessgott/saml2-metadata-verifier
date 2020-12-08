#!/usr/bin/env bash
#
#   verify SAML2 SP and IDP metadata
#   Author: Tom Morelly 
#   20201014

# shellcheck disable=SC2002
OPTIONS="--noout"

usage() {
  printf "%s\n" "Usage: ${0##*/} [OPTIONS...]"
  printf "\n%s\n" "OPTIONS:"
  printf "  %-25s%s\n" "-f, --file" "path to metadata file"
  printf "  %-25s%s\n" "-v, --verbose" "verbose"
  exit 0 
}

verify() {
  # $1 path to file that is verified
  # $2 xmllint options
  [[ ! -f $1 ]] && echo -e "$1 is not a file.\n" && usage
  XML_CATALOG_FILES="xcatalog/saml-metadata.xml" xmllint --schema saml-2.0-os/saml-schema-metadata-2.0.xsd "$2" $1
  exit $?
}

main() {
    [ $# -eq 0 ] && usage 
    while [ $# -ge 1 ]; do
        case "${1}" in
            -f|--file)
            verify "$2" $OPTIONS
            ;;
            -v|--verbose)
            OPTIONS="--load-trace"
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
