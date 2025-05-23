class UserDto {
  final int? id;
  final String fullName;
  final String? userName;
  final String email;
  final String? phone;
  final String? birthday;
  final int? roleId;
  final String? password;

  UserDto({
    this.id,
    required this.fullName,
    this.userName,
    required this.email,
    this.phone,
    this.birthday,
    this.roleId,
    this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    print("📦 Raw JSON in fromJson: $json");
    return UserDto(
      id: json['id'] ,
      fullName: json['fullName'] ?? '',
      userName: json['userName'] == "null" ? null : json['userName'],
      email: json['email'] ?? '',
      phone: json['phone'] == "null" ? null : json['phone'],
      birthday: json['birthday'] == "null" ? null : json['birthday'],
      roleId: json['roleId'],
      password: json['password'],
    );
  }

  /// ✅ Thêm phương thức toJson tại đây:
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'email': email,
      'phone': phone,
      'birthday': birthday,
      'roleId': roleId,
      'password': password,
    };
  }
}
