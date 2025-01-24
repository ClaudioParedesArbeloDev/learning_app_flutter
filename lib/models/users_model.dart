class UserModel {
  final int id;
  final String name;
  final String lastname;
  final String address;
  final String phone;
  final String email;
  final String? emailVerifiedAt;
  final String dni;
  final String dateBirth;
  final String username;
  final String? avatar;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.address,
    required this.phone,
    required this.email,
    this.emailVerifiedAt,
    required this.dni,
    required this.dateBirth,
    required this.username,
    this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

    factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      dni: json['dni'],
      dateBirth: json['date_birth'],
      username: json['username'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      );
    }
}