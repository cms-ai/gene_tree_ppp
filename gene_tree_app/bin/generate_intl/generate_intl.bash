#!/bin/bash

# Điều này đảm bảo script dừng lại nếu có lỗi xảy ra
set -e

# Thư mục gốc của dự án chính
PROJECT_DIR=$(pwd)
PUBSPEC_FILE="$PROJECT_DIR/pubspec.yaml"
parent_directory="$PROJECT_DIR/lib/modules"


# In hoa class
capitalize() {
  echo "$1" | awk '{print toupper(substr($0, 1, 1)) substr($0, 2)}'
}

generate_intl() {
    MODULE_DIR="$PROJECT_DIR/lib/modules/$1"

    # Tham số truyền vào
    ENABLED="true"
    ARB_DIR="lib/modules/$1/l10n/arbs"
    OUTPUT_DIR="lib/modules/$1/l10n/generated"
    DEFAULT_LOCALE="vi"
    classname="$1 Localizations"
    CLASS_NAME=""


    # Duyệt từng từ trong chuỗi
    for word in $classname; do
      # Chuyển chữ cái đầu tiên thành chữ hoa và các chữ cái còn lại thành chữ thường
      capitalized_word=$(echo "${word:0:1}" | tr '[:lower:]' '[:upper:]')$(echo "${word:1}" | tr '[:lower:]' '[:lower:]')
      CLASS_NAME+="$capitalized_word"  # Thêm từ đã chuyển đổi vào biến
    done



    # Kiểm tra xem file pubspec.yaml có tồn tại không
    if [[ -f "$PUBSPEC_FILE" ]]; then
      # echo "File pubspec.yaml đã tồn tại. Tạo bản sao lưu."
      cp "$PUBSPEC_FILE" "$PUBSPEC_FILE.bak"
    else
      echo "File pubspec.yaml không tồn tại. Tạo mới."
    fi

    # Hiển thị giá trị của các biến để kiểm tra
    # echo "ENABLED: $ENABLED"
    # echo "ARB_DIR: $ARB_DIR"
    # echo "OUTPUT_DIR: $OUTPUT_DIR"
    # echo "DEFAULT_LOCALE: $DEFAULT_LOCALE"

    # Tạo file pubspec.yaml từ file template
    sed -i '' "s|enabled: .*|enabled: $ENABLED|" "$PUBSPEC_FILE"
    sed -i '' "s|arb_dir: .*|arb_dir: $ARB_DIR|" "$PUBSPEC_FILE"
    sed -i '' "s|output_dir: .*|output_dir: $OUTPUT_DIR|" "$PUBSPEC_FILE"
    sed -i '' "s|default_locale: .*|default_locale: $DEFAULT_LOCALE|" "$PUBSPEC_FILE"
    sed -i '' "s|class_name: .*|class_name: $CLASS_NAME|" "$PUBSPEC_FILE"


    # Kiểm tra xem thư mục l10n có tồn tại không
    if [ -d "$ARB_DIR" ]; then
      echo "Generating intl files for $1..."
      cd "$MODULE_DIR"
      # Gọi flutter pub get cho toàn bộ dự án
      flutter pub get
      # run intl
      flutter pub run intl_utils:generate
      echo "Intl files generated successfully for $1!"
      cd "$PROJECT_DIR"
    else
      echo "No l10n directory found for $1. Skipping..."
    fi
  # done
}

# Khởi tạo mảng để chứa danh sách thư mục
MODULES=$(ls -d "$parent_directory"/*/ | xargs -n 1 basename)

# Chạy intl cho từng module
for folder in "${MODULES[@]}"; do
  echo "Intilizing modulle: $folder"
  generate_intl $folder
done
