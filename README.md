# Swift-FrameworkSample

サンプルアプリとLibraryをWorkspaceで管理するサンプルプロジェクトです。

## サンプルアプリとLibrary管理workspace作成手順

### workspaceの作成

1. workspaceを作成
1. workspaceと同階層にAppとLibraryを作成
1. workspaceを開く
1. Project Navigatorを右クリックし、「Add File to ~~」で作成したAppとLibraryの.xcodeprojを追加する

### サンプルアプリにLibraryの追加手順

1. workspaceのAppターゲットを選択
1. Generalの「Frameworks, Libraries and Embedded Content」に追加したLibraryを追加
1. サンプルアプリから利用可能状態になる

## xcFramework作成

```bash
xcodebuild -workspace ./WeatherApp.xcworkspace \
    -scheme FrameworkProject \
    -configuration Release \
    -sdk iphonesimulator \
    BUILD_DIR=".build" BUILD_ROOT=".build" clean build \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -workspace ./WeatherApp.xcworkspace \
    -scheme FrameworkProject \
    -configuration Release \
    -sdk iphoneos \
    BUILD_DIR=".build" BUILD_ROOT=".build" clean build \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework "FrameworkProject/.build/Release-iphoneos/FrameworkProject.framework" \
    -framework "FrameworkProject/.build/Release-iphonesimulator/FrameworkProject.framework" \
    -output "FrameworkProject/.build/FrameworkProject.xcframework"
```