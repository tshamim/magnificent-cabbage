#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e3eb25d1aecd2001990c0ab/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e3eb25d1aecd2001990c0ab
curl -s -X POST https://api.stackbit.com/project/5e3eb25d1aecd2001990c0ab/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e3eb25d1aecd2001990c0ab/webhook/build/publish > /dev/null
