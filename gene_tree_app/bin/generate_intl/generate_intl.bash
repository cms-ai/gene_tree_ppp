#!/bin/bash

# Điều này đảm bảo script dừng lại nếu có lỗi xảy ra
set -e

# Thư mục gốc của dự án chính
PROJECT_DIR=$(pwd)
# PUBSPEC_FILE="$PROJECT_DIR/pubspec.yaml"
PUBSPEC_FILE="$PROJECT_DIR/bin/templates/pubspec.yaml.tmpl"
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
    if [ ! -f "$TEMPLATE_FILE" ]; then
      echo "Template pubspec.yaml.tmpl không tồn tại tại: $TEMPLATE_FILE"
      exit 1
    fi

    echo "Bắt đầu tạo pubspec.yaml cho từng module..."
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


generate_intl_new() {
  MODULE_DIR="$PROJECT_DIR/lib/modules/$1"
  TEMPLATE_FILE="$PROJECT_DIR/bin/templates/intl/pubspec.yaml.tmpl"

  #  Tham số truyền vào
  ENABLED="true"
  ARB_DIR="lib/modules/$1/l10n/arbs"
  OUTPUT_DIR="lib/modules/$1/l10n/generated"
  DEFAULT_LOCALE="vi"
  classname="${1}Localizations"


  # Kiểm tra nếu file template tồn tại
  if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Template pubspec.yaml.tmpl không tồn tại tại: $TEMPLATE_FILE"
    exit 1
  fi

  echo "Bắt đầu tạo pubspec.yaml cho module $1..."

  output_file="$MODULE_DIR/pubspec.yaml"
  sed -e "s|\$CLASS_NAME|$classname|g" \
      -e "s|\$PATH_ARB|$ARB_DIR|g" \
      -e "s|\$PATH_GENERATED|$OUTPUT_DIR|g" \
      "$TEMPLATE_FILE" > "$output_file"
    # Xóa file pubspec.yaml sau khi tạo xong
  rm "$output_file"
  echo "Đã xóa pubspec.yaml cho module: $1"
}

# Khởi tạo mảng để chứa danh sách thư mục
# MODULES=$(ls -d "$parent_directory"/*/ | xargs -n 1 basename)

# # Chạy intl cho từng module
# for folder in "${MODULES[@]}"; do
#   echo "Intilizing modulle: $folder"
#   generate_intl_new $folder
# done

# echo "Hoàn thành tạo pubspec.yaml cho tất cả các module."



#!/bin/bash

# Đường dẫn đến thư mục chứa các modules
MODULES_DIR="${PROJECT_DIR}/lib/modules"

# Đường dẫn đến template pubspec.yaml.tmpl
TEMPLATE_FILE="${PROJECT_DIR}/bin/templates/intl/pubspec.yaml.tmpl"

# Kiểm tra nếu file template tồn tại
if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template pubspec.yaml.tmpl không tồn tại tại: $TEMPLATE_FILE"
  exit 1
fi

echo "Bắt đầu tạo pubspec.yaml cho từng module..."

# Lặp qua từng thư mục trong MODULES_DIR
for module_dir in "$MODULES_DIR"/*/; do
  module_name=$(basename "$module_dir")

  # Đường dẫn đến thư mục arb và output cho module này
  arb_path="lib/modules/$module_name/l10n/arbs"
  generated_path="lib/modules/$module_name/l10n"
  OUTPUT_DIR="lib/modules/$1/l10n/generated"
  class_name="${module_name}Localizations" # Đặt tên class, ví dụ Auth => AuthLocalization
  tag_module="$module_name"

  # Tạo pubspec.yaml từ template cho module hiện tại
  output_file="$module_dir/pubspec.yaml"
  sed -e "s|\$CLASS_NAME|$class_name|g" \
      -e "s|\$PATH_ARB|$arb_path|g" \
      -e "s|\$PATH_GENERATED|$OUTPUT_DIR|g" \
      -e "s|\$TAG_MODULE|$tag_module|g" \
      "$TEMPLATE_FILE" > "$output_file"

  echo "Đã tạo pubspec.yaml cho module: $module_name"

  # Chạy flutter pub get trong module để đảm bảo file được cập nhật nếu cần thiết
  (cd "$module_dir" && flutter pub get)

  # Xóa file pubspec.yaml, pubspec.lock và thư mục .dart_tool sau khi hoàn tất
  rm "$output_file"
  rm "$module_dir/pubspec.lock"
  rm -rf "$module_dir/.dart_tool"
  echo "Đã xóa pubspec.yaml, pubspec.lock, và .dart_tool cho module: $module_name"
done

echo "Hoàn thành tạo và xóa pubspec.yaml, pubspec.lock, và .dart_tool cho tất cả các module."
