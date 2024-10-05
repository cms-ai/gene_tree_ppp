echo "===== CLEAN ====="
make clean
echo "==== PUB DET ===="
flutter pub get
echo "Intilize build runner"
make build-runner
echo "===== Generate intl === "
make generate
echo ====== SETUP DONE ===== 