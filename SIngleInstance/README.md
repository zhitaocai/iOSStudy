# 单例

> http://www.jianshu.com/p/c0378a655c4e
> http://www.jianshu.com/p/c9f03e5b6b69
> http://www.jianshu.com/p/e5c4d280354d
> http://www.cnblogs.com/CoderAlex/p/5232214.html

## 前言

iOS的单例方法命名一般为：

* shared + 类名
* default + 类名
* 类名

## 全局设置环境为MRC

Build Settings 搜索 Automatic Reference

就可以指定项目环境从ARC（默认）转到MRC


## 设置指定源文件为 MRC 或者 ARC

项目默认是ARC，所以部分文件需要用MRC的话，到项目Build Phases中设置 Compile Sources，添加Compiler Flags添加

```
-fno-objc-arc
```

如果要支持ARC那么就是

```
-fobjc-arc
```
