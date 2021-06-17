FROM node:lts-alpine3.13
USER root

########################################################################
# Install Python3, JupyterLab
########################################################################

RUN \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk --update add \
      bash \
      build-base \
      bzip2 \
      ca-certificates \
      curl \
      libxml2-dev \
      libxslt-dev \
      openssh-client \
      patch \
      python3 \
      python3-dev \
      py3-pip \
      libzmq \
      musl-dev \
      zeromq-dev \
      libffi-dev \
      openssl-dev \
      readline-dev \
      tar \
      tini \
      wget && \
  rm -rf /var/cache/apk/* && \
  pip3 install --no-cache-dir jupyterlab && \
  mkdir /jupyterlab


########################################################################
# Install python2 kernel
########################################################################

RUN \
  apk --update add  \
      python2 \
      python2-dev && \
  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py > get-pip.py && \
  python2 get-pip.py && \
  pip2 install --no-cache-dir --upgrade ipykernel && \
  python2 -m ipykernel install --prefix=/usr/ --name python2 && \
  echo "### Cleanup unneeded files" && \
  rm -rf /usr/lib/python2*/*/tests && \
  rm -rf /usr/lib/python2*/ensurepip && \
  rm -rf /usr/lib/python2*/idlelib && \
  rm -rf /usr/share/man/*


########################################################################
# Install Go
########################################################################
RUN apk --update-cache --allow-untrusted \
        --repository http://dl-4.alpinelinux.org/alpine/edge/community \
        --arch=x86_64 add go && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    echo "### Install gophernotes" && \
    GOPATH=/go GO111MODULE=on go get github.com/gopherdata/gophernotes && \
    mkdir -p ~/.local/share/jupyter/kernels/gophernotes && \
    cd ~/.local/share/jupyter/kernels/gophernotes && \
    cp /go/pkg/mod/github.com/gopherdata/gophernotes@v0.7.2/kernel/*  "." && \
    chmod +w ./kernel.json  && \
    sed "s|gophernotes|/go/bin/gophernotes|" < kernel.json.in > kernel.json
ENV GOPATH /go

#########################################################################
# NodeJS
#########################################################################
#RUN npm install -g --unsafe-perm ijavascript && \
#    ijsinstall --install=global

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "lab", "--allow-root", "--port=8888", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password=''", "--no-browser", "--notebook-dir=/jupyterlab"]
