result=$(aws sts assume-role --role-arn arn:aws:iam::325714046698:role/py-created-roles/Production_Access_blackvelvet --role-session-name BLC --output text)
echo $result | awk '{ printf "export AWS_ACCESS_KEY_ID=%s\nexport AWS_SECRET_ACCESS_KEY=\%s\nexport AWS_SESSION_TOKEN=%s\n", $5, $7, $8 }'
