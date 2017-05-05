# 单例

> 
参考文章：
* http://www.jianshu.com/p/c0378a655c4e
* http://www.jianshu.com/p/c9f03e5b6b69
* http://www.jianshu.com/p/e5c4d280354d
* http://www.cnblogs.com/CoderAlex/p/5232214.html

## 1. 前言

iOS的单例方法命名一般为：

* shared + 类名
* default + 类名
* 类名

设计单例时，需要确定究竟采用哪种内存管理方式：ARC和MRC。不同管理方式，在写法上也有不同

### 1.1 全局设置环境为MRC

Build Settings 搜索 Automatic Reference

就可以指定项目环境从ARC（默认）转到MRC


### 1.2 设置指定源文件为 MRC 或者 ARC

项目默认是ARC，所以部分文件需要用MRC的话，到项目Build Phases中设置 Compile Sources，添加Compiler Flags添加

```
-fno-objc-arc
```

如果要支持ARC那么就是

```
-fobjc-arc
```

## ARC 单例写法

参考 [ARCSingleInstance.h](SIngleInstance/ARCSingleInstance.h) 和 [ARCSingleInstance.m](SIngleInstance/ARCSingleInstance.m) 

## MRC 单例写法

参考 [MRCSingleInstance.h](SIngleInstance/MRCSingleInstance.h) 和 [MRCSingleInstance.m](SIngleInstance/MRCSingleInstance.m)

## 整合ARC和MRC的单例写法到宏

单例写法都大同小异，因此我们可以考虑用宏来代替这些日常写法，需要注意的是用下面方法来区分究竟是ARC 还是 MRC

```c
#if __has_feature(objc_arc)
#else 
#endif
```

具体实现代码参考 [Macro.h](SIngleInstance/Macro.h)

