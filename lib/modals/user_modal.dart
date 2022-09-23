class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;

  UserModel({required this.id, required this.name, required this.password,required this.email,required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    //if (json == null) return null;
    return UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"]
    );
  }

  static List<UserModel> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}