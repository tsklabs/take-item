#
# EXPORTS
#

export BATS_HELPERS_DIR="${HOME}/.bats/test_helper"

export DEFAULT_SOURCE_LOCATION_PATH="docs"
export DEFAULT_SOURCE_LOCATION_FILE_PATH="docs/README.md"
export DEFAULT_SOURCE_LOCATION_FILE="README.md"
export DEFAULT_SOURCE_LOCATION_WITHOUT_PATH="github.com:lktslionel/mock-repo"
export DEFAULT_SOURCE_LOCATION_WITH_PATH="github.com:lktslionel/mock-repo:docs"
export DEFAULT_SOURCE_LOCATION_WITH_FILE_PATH="github.com:lktslionel/mock-repo:docs/README.md"
export DEFAULT_REPOSITORY="lktslionel/mock-repo"
export DEFAULT_DESTINATION_DIR="dst/default/dir"
export LOCATION_WITH_UNKNOWN_PROVIDER="unknown:wrong-resource"
export DEFAULT_REPOSITORY_NAME="mock-repo"

#
# BATS MODULES
#

load "${BATS_HELPERS_DIR}/bats-assert/load.bash"
load "${BATS_HELPERS_DIR}/bats-support/load.bash"
load "${BATS_HELPERS_DIR}/bats-file/load.bash"
