# flutter hybrid project

flutter 混合应用开发, 作为module集成进 android 和 ios

<img src="https://github.com/guobin211/flutter-material/blob/master/_static/jay_home.png" width="360"/>

## flutter项目打包和优化

## 项目优化

1. 代码层面的优化，减少冗余
2. 处理异常
3. 清除订阅
4. 压缩assets
5. 按需加载page，使用pageview
6. 使用keepalive要注意内存
7. Isolate运行后台计算
8. 图片资源按尺寸请求banner@800x300.png
9. ListView.builder()虚拟滚动,只显示屏幕区域的数据

## 打包android

1. 打包多个架构多个项目包
2. gradle 配置
3. app图标
4. 签名秘钥key
5. 混淆代码

## 打包ios

1. 申请开发者账号
2. 在app store 注册 app-id
3. 添加app名字和签名
4. 添加app图标
5. 创建存档

```bash
    
    flutter build ios
    
```

## 升级与适配问题

flutter
第三方包

全面屏适配
MediaQuery


## 集成混合开发

1. 创建原生项目
2. 创建flutter模块
3. 引入模块
4. 构建