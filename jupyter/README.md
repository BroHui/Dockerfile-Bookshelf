修改Jupyter笔记本内容字体

```shell
root@debian:~# docker cp jupyter:/home/jovyan/.jupyter/custom/custom.css .
root@debian:~# docker cp custom.css jupyter:/home/jovyan/.jupyter/custom/custom.css
```
增加
```css
#notebook-container * {
    font-family: Jetbrains Mono, "微软雅黑";
    font-size: 12px;
}
```
