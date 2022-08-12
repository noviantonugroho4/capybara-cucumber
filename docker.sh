#!/bin/bash
echo "=====:: Icebox Docker ::====="
# Sample usage:  docker run -v "$(PWD)":/app  -e t=@login -it kryptonite
echo $t

export RUBYOPT="-W0"

if [[ $application_type == 'api' ]]; then
  cd api-testing
else
  cd web
fi

cp .env.sample .env
ls

[ -x "$(command -v report_builder)" ] || bundle install
[ $current_stage == 'Artifactory' ] || bundle exec rake icebox:parallel_run

TEST_EXIT_CODE=$?
if [ $TEST_EXIT_CODE -ne 0 ]
then
  echo "=====:: Icebox FAILED !!! ::====="
  echo $TEST_EXIT_CODE
  exit 1
fi