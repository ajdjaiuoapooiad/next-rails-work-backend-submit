#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:clobber
bundle exec rails assets:precompile
bundle exec rails db:migrate # 無料プランの場合、コメントアウトを解除