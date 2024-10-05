.PHONY: clean

# Clean dự án
clean:
	flutter clean

# setup project trước khi run app
.PHONY: setup
setup:
	./bin/setup.bash

# Build APK hoặc iOS
.PHONY: build-android-dev
build:
	flutter build apk --release

# Chạy test unit
.PHONY: test
test:
	flutter test

.PHONY: build-runner
# Build runner cho project
build-runner:

# khởi tạo intl	
.PHONY: generate
generate:
	./bin/generate_intl/generate_intl.bash

# Chạy ứng dụng trên thiết bị kết nối
.PHONY: run
run:
	flutter run
