
abstract class AuthRequestImpl {
  Map<String, dynamic> toJson();
}

/// AUTO GENERATE PLEASE DON't MODIFY, 
/// you can remove id if it not nesscessary
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
