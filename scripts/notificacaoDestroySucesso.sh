#!/bin/bash

# curl -X POST -H 'Content-type: application/json' --data '{"text":"tudo deu certo na pipeline!"}' https://hooks.slack.com/services/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
curl -s -X POST https://api.telegram.org/bot1414485105:AAHiZeQkDjAjZl8NzwsAuBWP-of5w8gEoe0/sendMessage -d chat_id=-522831588 -d parse_mode="HTML" -d text=" \
<b> Status </b>: 🔥 Destruição do ambiente de produção completa! Ambiente: ${CI_COMMIT_BRANCH}"