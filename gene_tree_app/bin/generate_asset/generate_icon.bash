#!/bin/bash
# chmod +x generate_asset/generate_asset.sh

# Đường dẫn đến thư mục chứa assets (thay đổi tùy theo dự án của bạn)
ICON_DIR="assets/icons"

# Đường dẫn đến file Dart sẽ chứa các asset constants
OUTPUT_FILE="lib/generated/app_icons.dart"

# Tạo hoặc làm mới file assets.dart
echo "// This file is auto-generated. Do not modify it manually." > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "class AppIcons {" >> $OUTPUT_FILE

# Lặp qua tất cả các file trong thư mục assets và tạo mã Dart
find $ICON_DIR -type f | while read FILE; do
    # Lấy tên file và chuyển đổi sang định dạng sử dụng được trong Dart
    FILE_NAME=$(basename "$FILE")
    FILE_NAME_WITHOUT_EXTENSION=$(echo "$FILE_NAME" | sed 's/\.[^.]*$//')
    VARIABLE_NAME=$(echo "$FILE_NAME_WITHOUT_EXTENSION" | sed 's/[^a-zA-Z0-9]/_/g')

    # Thêm dòng constant vào file Dart
    echo "  static const String $VARIABLE_NAME = '$FILE';" >> $OUTPUT_FILE
done

# Kết thúc file Dart
echo "}" >> $OUTPUT_FILE

echo "Generated assets.dart successfully at $OUTPUT_FILE"
