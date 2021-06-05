#!/bin/bash
docker run -d --restart=always --name jupyter -p 8888:8888 -v $(pwd)/rundata:/home/jovyan myjupyter
