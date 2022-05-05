#!/usr/bin/env bats

load "../test_helper"

load "${ACTION_SOURCE_DIR}/action.bash"


@test "it must get the provider name from a github location w/o path" {
  run action:provider_from_location "${DEFAULT_SOURCE_LOCATION_WITHOUT_PATH}"
  
  assert_equal "${output}" "${GITHUB_PROVIDER_NAME}"
}

@test "it must get the provider name from a github location w/ path" {
  run action:provider_from_location "${DEFAULT_SOURCE_LOCATION_WITHOUT_PATH}"
  
  assert_equal "${output}" "${GITHUB_PROVIDER_NAME}"
}

@test "it must set the 'file' provider name as default if missing provider from location" {
  run action:provider_from_location "resource-name-wo-provider"
  
  assert_equal "${output}" "${ACTION_DEFAULT_PROVIDER}"
}

@test "it must fail to get the provider name if the given location has an unknown provider" {
  run action:provider_from_location "unknown:resource-name-wo-provider"
  
  assert_failure
}