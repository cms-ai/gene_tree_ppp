import 'package:gene_tree_app/api/auth/auth_service.dart';
import 'package:gene_tree_app/api/auth/models/request/auth_request.dart';

class AuthFirebaseService {
  final authService = AuthServices();
  Future<bool> login(String username, String password) async {
    // Gọi API thực sự để xác thực
    authService.getData(AuthRequest());
    return username == "user" && password == "pass";
  }

  Future<bool> signUp(String username, String password) async {
    // Gọi API thực sự để xác thực
    return username == "user" && password == "pass";
  }

  Future<void> logout() async {
    // Gọi API thực sự để đăng xuất
  }

  Future<bool> isLoggedIn() async {
    // Kiểm tra nếu người dùng đã đăng nhập
    return false;
  }
}
