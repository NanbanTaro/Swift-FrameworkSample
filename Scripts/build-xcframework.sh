#!/bin/bash
# コマンドの失敗・未定義変数の参照・パイプ内の失敗時に処理を停止する。
set -euo pipefail

# 実行した場所に依存しないよう、スクリプトのある Scripts の1階層上へ移動する。
cd "$(dirname "$0")/.."
mkdir -p .build

# Archive と DerivedData を置く、今回の実行専用の一時ディレクトリを作成する。
RUN_DIR="$(mktemp -d)"
# 完成した XCFramework の保存先。
OUTPUT_PATH=".build/FrameworkProject.xcframework"
# 正常終了時や途中のエラーによる終了時に、一時ディレクトリを削除する。
trap 'rm -rf "$RUN_DIR"' EXIT

# 実機用と Simulator 用の Framework を、それぞれ Release で Archive する。
# 配布用のビルド設定を有効にし、Framework を Archive に含める。コード署名は行わない。
for PLATFORM in device simulator; do
    if [[ "$PLATFORM" == device ]]; then
        DESTINATION='generic/platform=iOS'
    else
        DESTINATION='generic/platform=iOS Simulator'
    fi
    xcodebuild archive \
        -project FrameworkProject/FrameworkProject.xcodeproj \
        -scheme FrameworkProject \
        -configuration Release \
        -destination "$DESTINATION" \
        -derivedDataPath "$RUN_DIR/DerivedData" \
        -archivePath "$RUN_DIR/$PLATFORM.xcarchive" \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO \
        CODE_SIGNING_ALLOWED=NO
done

# 2種類の Archive 内の Framework を、1つの XCFramework にまとめる。
xcodebuild -create-xcframework \
    -framework "$RUN_DIR/device.xcarchive/Products/Library/Frameworks/FrameworkProject.framework" \
    -framework "$RUN_DIR/simulator.xcarchive/Products/Library/Frameworks/FrameworkProject.framework" \
    -output "$RUN_DIR/FrameworkProject.xcframework"

# 生成が完了したら既存の成果物を削除し、新しい成果物へ置き換える。
rm -rf "$OUTPUT_PATH"
mv "$RUN_DIR/FrameworkProject.xcframework" "$OUTPUT_PATH"
echo "Created: $OUTPUT_PATH"
