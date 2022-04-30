#!/bin/bash

# curl -X POST -H 'Content-type: application/json' --data '{"text":"ops! algo deu errado"}' https://hooks.slack.com/services/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
curl -s -X POST https://api.telegram.org/<token-bot>/sendMessage -d chat_id=<chat-id> -d parse_mode="HTML" -d text="
<b> Status </b>:  🔴 Ops! Algo deu errado com a tentativa de destrição do ambiente de produção"
