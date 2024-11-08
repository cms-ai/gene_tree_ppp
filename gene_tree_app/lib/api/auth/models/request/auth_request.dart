abstract class AuthRequestImpl {
  Map<String, dynamic> toJson();
}

class AuthRequest implements AuthRequestImpl {
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
