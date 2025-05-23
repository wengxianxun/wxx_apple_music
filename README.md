# Apple Music App

基于 Flutter 的跨平台音乐播放与搜索应用，提供音乐浏览、搜索、播放等核心功能，适配 iOS/Android 双端。

## 功能特性

- **音乐主页**：展示推荐音乐列表（`HomeView`），支持点击查看单首音乐详情（`HomeTrackCell`）
- **智能搜索**：支持音乐/专辑关键词搜索（`MusicSearchView`），包含搜索历史记录（`SearchNormalView`）和结果展示（`SearchResultView`）
- **主题适配**：支持浅色/深色主题切换（基于 `HuuuaThemeLight`/`HuuuaThemeDark` 配置）
- **网络适配**：自动检测网络状态（`AppController` 中 `checkNet` 方法），无网络时显示启动引导页（`AppLunchView`）
- **屏幕适配**：使用 `flutter_screenutil` 实现不同设备尺寸的适配（设计稿基准 375x812）

## 技术栈

- **框架**：Flutter 3.x（跨平台 UI 开发）
- **状态管理**：GetX（`MusicSearchController`/`AppController` 等控制器）
- **网络请求**：自定义 API 仓库 `HuuuaApiRepository`（基于 `HuuuaApiProvider`）
- **本地存储**：`Persistence` 工具类（初始化本地存储）
- **UI 组件**：自定义搜索栏（`SearchAppBar`）、加载动画（`LoadingView`）、空状态提示（`NothingView`）等
- **国际化**：支持多语言翻译（`HuuuaTranslate`）

## 快速开始

### 环境要求
- Flutter SDK（>=3.0.0）
- Dart SDK（>=2.17.0）
- iOS 开发需 Xcode（>=13.0）
- Android 开发需 Android Studio（>=4.2）

### 安装与运行

1. 克隆项目：
```bash
git clone https://github.com/wxx/Documents/GitHub/wxx_apple_music/apple_music_app.git
cd apple_music_app


目录结构
apple_music_app/
├── android/           # Android 原生配置
├── ios/               # iOS 原生配置
├── lib/               # 核心业务代码
│   ├── api/           # 网络请求层（provider/repository）
│   ├── config/        # 全局配置（主题/存储/翻译）
│   ├── model/         # 数据模型（TrackModel/SearchResult 等）
│   ├── pages/         # 页面模块（app/home/search）
│   ├── routes/        # 路由管理（AppPages/AppRoutes）
│   └── util/          # 工具类（加载/空状态/适配）
├── assets/            # 资源文件（图片/字体）
├── test/              # 单元测试
└── pubspec.yaml       # 依赖配置