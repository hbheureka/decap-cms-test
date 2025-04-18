#!/bin/bash

if [ -z ${BASE_URL} ]; then
  BASE_URL=${CF_PAGES_URL}
fi

if [ "$CF_PAGES_BRANCH" == "main" ]; then
  git fetch --unshallow && hugo -b $BASE_URL --gc --minify --templateMetrics --templateMetricsHints --forceSyncStatic --enableGitInfo
else
  git fetch --unshallow && hugo -b $CF_PAGES_URL --gc --minify --templateMetrics --templateMetricsHints --forceSyncStatic --enableGitInfo
fi