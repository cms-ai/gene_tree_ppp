
abstract class UserRequestImpl {
  Map<String, dynamic> toJson();
}

class UserRequest extends UserRequestImpl {
  final String? id;
  UserRequest({
    this.id,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
