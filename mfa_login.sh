ARN_OF_MFA=arn:aws:iam::166058053690:mfa/pkrayzel-prod
DURATION=129600
AWS_CLI_PROFILE=private_developer
MFA_TOKEN_CODE=$1

if [ "$#" -eq 2 ]; then
    if [ "$1" == "made" ]; then
        ARN_OF_MFA="arn:aws:iam::961880582300:mfa/pavel.krayzel"
        MFA_TOKEN_CODE=$2
        AWS_CLI_PROFILE=made_developer
    fi
fi

read KEY SECRET TOKEN <<< \
  $(aws --profile $AWS_CLI_PROFILE sts get-session-token \
    --duration $DURATION  \
    --serial-number $ARN_OF_MFA \
    --token-code $MFA_TOKEN_CODE \
    --output text  | awk '{ print $2, $4, $5 }')

export AWS_ACCESS_KEY_ID=$KEY
export AWS_SECRET_ACCESS_KEY=$SECRET
export AWS_SESSION_TOKEN=$TOKEN
