// ignore: constant_identifier_names
enum GenderEnum { MALE, FEMALE, OTHER }

extension GenderEnumExt on GenderEnum {
  String enumToString() {
    return name;
  }
}
