Jupyter

Kernels:
* Python3
* Python2
* Go
* NodeJS

```
docker build -t jupyter:alpine -f Dockerfile.alpine .
docker run -d --restart=always --name jupyter -p 8888:8888 -v $(pwd)/rundata:/notebooks jupyter:alpine
```


![](https://github.com/BroHui/Dockerfile-Bookshelf/blob/main/jupyter/20210615231006.png)
