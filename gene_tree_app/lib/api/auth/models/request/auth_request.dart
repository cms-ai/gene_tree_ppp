
abstract class AuthRequestImpl {
  Map<String, dynamic> toJson();
}

class AuthRequest extends AuthRequestImpl {
  final String? id;
  AuthRequest({
    this.id,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
