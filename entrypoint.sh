#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /auction-api/tmp/pids/server.pid

bundle exec rails db:create
bundle exec rails migration:apply
bundle exec rails s -p 3000 -b '0.0.0.0'

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"