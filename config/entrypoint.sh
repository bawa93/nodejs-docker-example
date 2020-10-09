#!/bin/bash

set -e

pm2 start /config/pm2.json
exec "$@"
