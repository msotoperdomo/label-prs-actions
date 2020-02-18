#!/bin/bash
set -e

label_pr_remove() {
    echo "This action will add a label of a PR"

    if [[ -z "${ADD_LABEL}" ]]; then
      echo "Set the ADD_LABEL env variable."
      exit 1
    fi

    curl -sSL \
      -H "${AUTH_HEADER}" \
      -H "${API_HEADER}" \
      -X POST \
      -H "Content-Type: application/json" \
      -d "{\"labels\":[\"${ADD_LABEL}\"]}" \
      "${URI}/repos/${GITHUB_REPOSITORY}/issues/${number}/labels"

}