#!/bin/bash
set -e

label_pr_remove() {
    echo "This action will remove the label of a PR"

    if [[ -z "${REMOVE_LABEL}" ]]; then
      echo "Set the REMOVE_LABEL env variable."
      exit 1
    fi

    if [[ "${action}" == "submitted" ]] && [[ "${state}" == "approved" ]]; then

      curl -sSL \
        -H "${AUTH_HEADER}" \
        -H "${API_HEADER}" \
        -X DELETE \
        "${URI}/repos/${GITHUB_REPOSITORY}/issues/${number}/labels/${REMOVE_LABEL}"

        time=$(date)
        echo ::set-output name=time::${time}
    else
        echo "Ignoring event ${action} ${state}"
    fi

}