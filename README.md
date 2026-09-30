# AMapNoSplash — 高德 16.20.1 / RootHide

按 RootHide/roothide Theos 打包，不是普通 rootless。
当前实现只隐藏启动阶段文字为“跳过 / Skip / 关闭 / Close”的按钮，
不会删除整个启动控制器，也不会拦截网络。

RootHide 官方文档要求使用 `THEOS_PACKAGE_SCHEME=roothide`。
如果你的 Relaxin/Bootstrap 提供 App List/Tweak Injection 开关，需要对高德开启注入。

项目带 GitHub Actions，可在 GitHub 网页端手动触发编译，无需电脑本地编译。
