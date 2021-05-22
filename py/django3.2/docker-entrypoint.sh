#!/bin/bash

APP_ROOT='/usr/src/app'
STATIC_ROOT='/usr/src/static'
NODE_MODULES='/usr/src/node_modules'

cd $APP_ROOT

# collect statics
sed -i '/node_modules/c\"'$NODE_MODULES'",' `find . | grep settings.py`
sed -i '/^STATIC_ROOT/c\STATIC_ROOT="'$STATIC_ROOT'"' `find . | grep settings.py`
python manage.py collectstatic --noinput

# remove debug symbol
sed -i '/^DEBUG/c\DEBUG=False' `find . | grep settings.py`



exec $@
