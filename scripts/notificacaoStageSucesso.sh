#!/bin/bash

# curl -X POST -H 'Content-type: application/json' --data '{"text":"tudo deu certo na pipeline!"}' https://hooks.slack.com/services/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
curl -s -X POST https://api.telegram.org/bot1414485105:AAHiZeQkDjAjZl8NzwsAuBWP-of5w8gEoe0/sendMessage -d chat_id=-522831588 -d parse_mode="HTML" -d text="
<b>Date</b>: $(date '+%Y-%m-%d') \

<b>User </b>: $GITLAB_USER_EMAIL \

<b>Project </b>: $CI_PROJECT_NAME \

<b>Branch </b>: $CI_COMMIT_REF_NAME \

<b>Status </b> : 🟢 SUCESSO! \

<b>Ações </b>: Vá até o link abaixo para uma melhor visualização da validação e para aplicar as modificações. \

<B>URL</b>: $CI_PROJECT_URL/-/pipelines/$CI_PIPELINE_ID "
