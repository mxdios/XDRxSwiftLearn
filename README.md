# XDRxSwiftLearn

克隆RxSwift，运行示例：

```
git clone git@github.com:ReactiveX/RxSwift.git
```

双击`Rx.xcworkspace`，工程中选择`RxExample-iOS`运行。

## 概念

RxSwift让编程更简单，让功能逻辑更紧凑。其思想为函数响应式，以一等公民的函数为工具，绑定数据联动，数据改变实时反映到结果呈现。

## 项目集成

将RxSwift集成到项目中，使用CocoaPods的方式：

创建项目时勾选`Include Unit Tests`，包含单元测试。

创建`Podfile`文件，输入如下内容：

```
# Podfile
use_frameworks!

target '工程名字' do
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end

# RxTests 和 RxBlocking 将在单元/集成测试中起到重要作用
target '单元测试文件夹名字' do
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
end
```

将工程名和单元测试名换成自己的，执行命令：

```
pod install
```



# 学习资料

[靛青K神出品RxSwift 学习指导索引](http://t.swift.gg/d/2-rxswift)



