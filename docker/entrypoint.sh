#!/bin/sh
set -e

# Jika ada argumen (mis. dari Render pre-deploy: php artisan migrate --force)
if [ "$#" -gt 0 ]; then
    exec "$@"
fi

php artisan package:discover --ansi --no-interaction

exec php artisan serve --host=0.0.0.0 --port="${PORT:?PORT must be set}"
