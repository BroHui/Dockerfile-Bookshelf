docker run --rm -it --name django -p 8081:8081 -v /root/django1.11/demo:/data -e "UWSGI_INI=/data/demo.ini" django1.11-elite
