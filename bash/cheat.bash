# simple wrapper to call 'cheat.sh' with curl

run_cheat_sh () {
    
    CHEAT_TEXT="cheat.sh/"

    if (( $# < 2 )); then
        echo "usage: cheat <language> ...<query strings>"
        return 0
    fi

    # add langauge
    CHEAT_TEXT+="$1/"
    shift

    # add search strings
    while (( $# > 0 )); do
        if (( $# == 1)); then
            CHEAT_TEXT+="$1"
        else
            CHEAT_TEXT+="$1+"
        fi
        shift
    done

    curl "$CHEAT_TEXT"
}

alias cheat=run_cheat_sh
