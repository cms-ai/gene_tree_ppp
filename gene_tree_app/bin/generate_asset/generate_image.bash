#!/bin/bash

# Đường dẫn đến thư mục chứa assets (thay đổi tùy theo dự án của bạn)
ASSETS_DIR="assets/images"

# Đường dẫn đến file Dart sẽ chứa các asset constants
OUTPUT_FILE="lib/generated/app_images.dart"

# Tạo hoặc làm mới file app_images.dart
echo "// This file is auto-generated. Do not modify it manually." > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "class AppImages {" >> "$OUTPUT_FILE"

# Hàm chuyển đổi từ tên file sang camelCase
toCamelCase() {
    echo "$1" | awk -F'_' '{
        for (i=1; i<=NF; i++) {
            if (i==1) {
                printf "%s", tolower($i);
            } else {
                printf "%s", toupper(substr($i, 1, 1)) substr($i, 2);
            }
        }
    }'
}

# Lặp qua tất cả các file trong thư mục assets và tạo mã Dart
find "$ASSETS_DIR" -type f | while read -r FILE; do
    # Lấy tên file và chuyển đổi sang định dạng sử dụng được trong Dart
    FILE_NAME=$(basename "$FILE")
    FILE_NAME_WITHOUT_EXTENSION="${FILE_NAME%.*}"
    VARIABLE_NAME=$(echo "$FILE_NAME_WITHOUT_EXTENSION" | sed 's/[^a-zA-Z0-9]/_/g')
    SNAKE_CASE_NAME=$(toCamelCase "$VARIABLE_NAME")
    
    # Thêm dòng constant vào file Dart
    echo "  static const String $SNAKE_CASE_NAME = '$FILE';" >> "$OUTPUT_FILE"
done

# Kết thúc file Dart
echo "}" >> "$OUTPUT_FILE"

echo "Generated app_images.dart successfully at $OUTPUT_FILE"
