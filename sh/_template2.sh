#!/bin/bash
set -euC

progname=$(basename $0)
progversion="0.1.0"

# actions.
usage() {
    echo "Usage: $progname [OPTIONS] COMMAND"
    echo
    echo "Options:"
    echo "  -h, --help         show help."
    echo "  -v, --version      print the version."
    echo "  -d, --dir <DIR>    change working directory."
    echo
    echo "Commands:"
    echo "  help        show help."
    echo
}

printversion() {
    echo "${progversion}"
}

# parse arguments and options.
declare -a params=()
for OPT in "$@"
do
    case "$OPT" in
        '-h'|'--help' )
            usage
            exit 0
            ;;
        '-v'|'--version' )
            # パラメータを取らないオプション
            printversion
            exit 0
            ;;
        '-d'|'--dir' )
            # パラメータを取るオプション。 "-d /tmp"のようにスペースで区切ってパラメータを渡す。
            if [[ -z "${2:-}" ]] || [[ "${2:-}" =~ ^-+ ]]; then
                echo "$progname: option '$1' requires an argument." 1>&2
                exit 1
            fi
            optarg="$2"

            cd $optarg
            shift 2
            ;;
        '--'|'-' )
            shift 1
            params+=( "$@" )
            break
            ;;
        -*)
            echo "$progname: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
            exit 1
            ;;
        *)
            if [[ ! -z "${1:-}" ]] && [[ ! "${1:-}" =~ ^-+ ]]; then
                params+=( "$1" )
                shift 1
            fi
            ;;
    esac
done

# サブコマンドに対応して処理を実行
command="" && [ ${#params[@]} -ne 0 ] && command=${params[0]}
case $command in
    'help' )
        usage
        exit 0
        ;;
    '' )
        usage
        exit 0
        ;;
    *)
        echo "$progname: illegal command '$command'" 1>&2
        exit 1
        ;;
esac
