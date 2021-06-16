Jupyter  (Full image size: 1.14GB)

Base on Alpine 3.10 (size: 5MB)

Kernels:
* Python3 (size: base, cannot remove! about 380MB)
* Python2 (Size: about 83MB)
* Go (Size: about 476MB)
* NodeJS (size: about 115MB)

Features:
* NBExtensions Support (size: about 80MB)
* cell edit font custom as Jetbrains Mono

```
docker build -t jupyter:alpine -f Dockerfile.alpine .
docker run -d --restart=always --name jupyter -p 8888:8888 -v $(pwd)/rundata:/notebooks jupyter:alpine
```


![](https://github.com/BroHui/Dockerfile-Bookshelf/blob/main/jupyter/20210615231006.png)
