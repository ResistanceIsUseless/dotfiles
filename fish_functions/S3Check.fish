function S3check --description 'use domain/path to check S3 bucket config' --argument-names domain
    aws s3 ls s3://$domain --no-sign-request
end

function ScCheck-auth --description '' --argument-names domain
     aws s3 ls --profile eng1 s3://$domain 
