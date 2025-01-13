import 'package:flutter_test/flutter_test.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({}); // Reset dữ liệu trước mỗi test
  });

  test('saveData and getData should work correctly', () async {
    const key = SharePreferenceKeys.token;

    // Lưu dữ liệu
    final isSaved = await key.saveData<String>("test_token");
    expect(isSaved, true);

    // Lấy dữ liệu
    final token = await key.getData<String>();
    expect(token, "test_token");
  });

  test('removeData should remove stored data', () async {
    const key = SharePreferenceKeys.token;

    // Lưu dữ liệu
    await key.saveData<String>("test_token");

    // Xóa dữ liệu
    await key.removeData();

    // Kiểm tra dữ liệu
    final token = await key.getData<String>();
    expect(token, null);
  });

  test('containsKey should return correct value', () async {
    const key = SharePreferenceKeys.token;

    // Trước khi lưu dữ liệu
    var hasKey = await key.containsKey();
    expect(hasKey, false);

    // Sau khi lưu dữ liệu
    await key.saveData<String>("test_token");
    hasKey = await key.containsKey();
    expect(hasKey, true);
  });

  test('clearAllData should remove only keys in SharePreferenceKeys', () async {
    const key1 = SharePreferenceKeys.token;
    const key2 = SharePreferenceKeys.refreshToken;

    // Lưu dữ liệu
    await key1.saveData<String>("test_token");
    await key2.saveData<String>("test_refresh_token");

    // Xóa tất cả dữ liệu
    await key1.clearAllData();

    // Kiểm tra dữ liệu
    expect(await key1.getData<String>(), null);
    expect(await key2.getData<String>(), null);
  });
}
