#
# ADDDONS
#

bats:within_testsuite() {
if [[ -n ${BATS_TEST_FILENAME} ]]; then
        return 0
    else
        return 1
    fi
}

export DEFAULT_FILE_DESCRIPTOR=2

# set default file descriptor depending on the running env
if bats:within_testsuite; then
    export DEFAULT_FILE_DESCRIPTOR=3
fi

x:getdatetime(){
    printf "time=%s" "$(date +%Y%m%dT%H%M%SZ)"
}

x:step() {
    local message="${*}"
    echo -e "" >&$DEFAULT_FILE_DESCRIPTOR
    echo -e "$(x:getdatetime) - ${__PROGRAM__}: ${message}" >&$DEFAULT_FILE_DESCRIPTOR
}

x:task() {
    local message="${*}"
    echo -e "$(x:getdatetime) - ${__PROGRAM__}: ${message} ..." >&$DEFAULT_FILE_DESCRIPTOR
}

x:log() {
    local message="${*}"
    if [[ ${__DEBUG_MODE_ENABLED__} == "true" ]]; then
        echo -e "$(x:getdatetime) - ${__PROGRAM__}: ${message}" >&$DEFAULT_FILE_DESCRIPTOR
    fi;

    if gh:within_workflow; then 
        gh:debug "${message}"
    fi
}

x:err() {
    local message="${*}"
    echo -e "$(x:getdatetime) - ${__PROGRAM__}: ERROR - ${message}" >&$DEFAULT_FILE_DESCRIPTOR

    if gh:within_workflow; then 
        gh:err "${message}"
    fi

    exit 1
}

x:done() {
    echo -e "$(x:getdatetime) - ${__PROGRAM__}: Done." >&$DEFAULT_FILE_DESCRIPTOR
    echo -e "" >&$DEFAULT_FILE_DESCRIPTOR
}


x:check() {
local _code=$1
shift
local _message="${*}"
if [[ ${_code} != 0 ]]; then
    x:err "${_message}"
    exit 1
else
    x:log "Success."
fi;
}

gh:within_workflow() {
    if [[ -n ${GITHUB_WORKFLOW} ]]; then
        return 0
    else
        return 1
    fi
}

gh:output() {
    local name=$1
    local value=$2
    echo "::set-output name=${name}::${value}"
}

gh:setenv() {
    local name=$1
    local value=$2
     echo "${name}=${value}" >> "${GITHUB_ENV}"
}

gh:err() {
    local message="${*}"
     echo "::error::${message}"
}

gh:notice() {
    local message="${*}"
     echo "::notice::${message}"
}

gh:debug() {
    local message="${*}"
     echo "::debug::${message}"
}



