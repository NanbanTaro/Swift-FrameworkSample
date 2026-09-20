![](https://img.shields.io/badge/Swift-6.x-EB7243)
![](https://img.shields.io/badge/Xcode-27.0-61DAFB)


# Swift-FrameworkSample

サンプルアプリと Framework を Workspace で管理し、配布用 XCFramework を生成するサンプルです。

## 開発環境

- macOS 27.0
- Xcode 27.0（Build 27A266a）
- Swift 6.4（Xcode 同梱）
- Swift Language Mode：Swift 6

## 構成

```text
Swift-FrameworkSample
├── Sample.xcworkspace
├── AppProject
│   ├── AppProject.xcodeproj
│   └── App
├── FrameworkProject
│   ├── FrameworkProject.xcodeproj
│   ├── Sources
│   └── Tests
├── Scripts
│   └── build-xcframework.sh
└── .build
    └── FrameworkProject.xcframework
```

`.build` はビルド時に作成される Git 管理対象外のディレクトリです。

## 開発

1. `Sample.xcworkspace` を開く

### サンプルアプリのビルド

2. `AppProject` Scheme で実行
3. サンプルアプリのビルド

サンプルアプリは、XCFrameworkではなくFrameworkを参照します。

### Frameworkのビルド

2. `FrameworkProject` Scheme で実行
3. Frameworkのビルド

Command Line Tools が選択されている場合は、利用する Xcode のパスを指定してください。この環境では次の指定で検証しています。

```bash
export DEVELOPER_DIR=/Applications/Xcode-27.0.0.app/Contents/Developer
```

## XCFramework の生成

### 1. スクリプトからの生成

```bash
./Scripts/build-xcframework.sh
```

任意の作業ディレクトリから実行できます。iOS 実機用と Simulator 用を Release で Archive し、`.build/FrameworkProject.xcframework` にまとめます。配布ビルドでは下記で指定しています。
- `BUILD_LIBRARY_FOR_DISTRIBUTION=YES`
- `SKIP_INSTALL=NO`
- `CODE_SIGNING_ALLOWED=NO`

### 2. `BuildXCFramework` Schemeでの生成

`BuildXCFramework` ターゲットも同じスクリプトを呼び出します。

### 解説記事

TBD