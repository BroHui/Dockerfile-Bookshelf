Jupyter (Size: 1.14GB)

Kernels:
* Python3 (size: base, cannot remove! about 600MB)
* Python2 (Size: about 200MB)
* Go (Size: about 350MB)
* NodeJS (size: about 50MB)

Features:
* NBExtensions Support
* cell edit font custom as Jetbrains Mono

```
docker build -t jupyter:alpine -f Dockerfile.alpine .
docker run -d --restart=always --name jupyter -p 8888:8888 -v $(pwd)/rundata:/notebooks jupyter:alpine
```


![](https://github.com/BroHui/Dockerfile-Bookshelf/blob/main/jupyter/20210615231006.png)
