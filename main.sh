#!/bin/bash

GH_TOKEN=$1
ISSUE_ID=$2
COMMENT=$3
GITHUB_REPOSITORY=$4

response=$(curl -s -X POST -H "Authorization: token ${GH_TOKEN}" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${ISSUE_ID}/comments \
    -d "{\"body\": \"${COMMENT}\"}")

comment_id=$(echo "$response" | jq -r .id)

echo "comment-id=${comment_id}" >> "$GITHUB_OUTPUT"

echo "Comentário adicionado com sucesso! ID do comentário: $comment_id"
