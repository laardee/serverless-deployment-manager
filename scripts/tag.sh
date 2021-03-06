#!/usr/bin/env bash

# if master branch and not a pull request
if [ $TRAVIS_BRANCH == 'master' ] && [ -z $TRAVIS_PULL_REQUEST_BRANCH ]
then
  sleep 5
  latest=$(npm info serverless-deployment-manager dist-tags.latest)
  git tag v${latest}
  git push https://maasglobal:$GITHUB_API_TOKEN@github.com/maasglobal/serverless-deployment-manager v${latest}
else
  echo "Package is tagged only from master branch"
fi
