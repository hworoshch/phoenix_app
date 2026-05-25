#!/bin/sh
set -e

/app/bin/phoenix_app eval "PhoenixApp.Release.migrate"

exec /app/bin/phoenix_app start
