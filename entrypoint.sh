#!/bin/bash
set -ex


label_pr_when_approved() {
    echo "This action will label a PR when approved"
    time=$(date)
    echo ::set-output name=time::${time}
}

remove_label_pr() {
    echo "This action will remove the label of a PR"
}


PR_ACTION="$1"

if [[ -z "$GH_TOKEN" ]]; then
  echo "Set the GH_TOKEN env variable."
  exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
  echo "Set the GITHUB_REPOSITORY env variable."
  exit 1
fi

if [[ -z "$GITHUB_EVENT_PATH" ]]; then
  echo "Set the GITHUB_EVENT_PATH env variable."
  exit 1
fi

if [[ -z "$PR_ACTION" ]]; then
  echo "Set the PR_ACTION env variable."
  exit 1
fi

echo "PR ACTION: ${PR_ACTION}"

case "${PR_ACTION}" in
    label_pr_when_approved)
        label_pr_when_approved $@;;
    remove_label_pr)
        remove_label_pr $@;;
esac