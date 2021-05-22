#!/bin/bash

APP_ROOT='/usr/src/app'
STATIC_ROOT='/usr/src/static'

cd $APP_ROOT

# collect statics
sed -i '/^STATIC_ROOT/c\STATIC_ROOT="'$STATIC_ROOT'"' `find . | grep settings.py`
python manage.py collectstatic --noinput

# remove debug symbol
sed -i '/^DEBUG/c\DEBUG=False' `find . | grep settings.py`

exec $@
