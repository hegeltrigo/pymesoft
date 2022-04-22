#!/bin/bash
set -e
STACK_NAME=$1
AWS_VERSION_LABEL=$2
if [ -z "${STACK_NAME}" ]
  then
  echo "you need to provide an stack e.g: /deployment/docker/compose/deployment/deploy.sh s100"
  exit 1
fi

ENVIRONMENT_NAME="eb-envr-$STACK_NAME"
APP_NAME="eb-apr-$STACK_NAME"


function create_app_version() {
  # default created by elastic beanstalk
  S3_BUCKET="elasticbeanstalk-us-east-1-202573007936"
  S3_KEY="$AWS_VERSION_LABEL.zip"
  echo "Creating zip file"
  cd /deployment
  git config --global alias.zip 'archive HEAD -o'
  git zip /tmp/"${AWS_VERSION_LABEL}".zip

  aws s3 cp "/tmp/${AWS_VERSION_LABEL}".zip s3://${S3_BUCKET}/"${ENVIRONMENT_NAME}"/"${S3_KEY}"
  rm -rf "/tmp/${AWS_VERSION_LABEL}".zip

  echo "Creating new app version"
  aws elasticbeanstalk create-application-version \
    --application-name "${APP_NAME}" \
    --version-label "$AWS_VERSION_LABEL" \
    --source-bundle S3Bucket=${S3_BUCKET},S3Key="${ENVIRONMENT_NAME}"/"${S3_KEY}" \
    --description "Deploy"
}

function deploy_app_version() {
    echo "Deploying EB"
    aws elasticbeanstalk update-environment \
        --application-name "${APP_NAME}" \
        --environment-name "${ENVIRONMENT_NAME}" --version-label "$AWS_VERSION_LABEL"
}


if [ -z "${AWS_VERSION_LABEL}" ]
then
  # create app version and deploy it
  AWS_VERSION_LABEL=$(date +"%Y%m%d%H%M%S")
  create_app_version
  deploy_app_version
else
  # deploy an app version
  deploy_app_version
fi



