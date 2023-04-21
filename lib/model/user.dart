class UserData {

  late String id;
  late final String name;
  late final String age;
  late final String gender;
  late final String pImageUrl;

  UserData({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.pImageUrl,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'pImageUrl': pImageUrl,
  };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'],
    name: json['name'],
    age: json['age'],
    gender: json['gender'],
    pImageUrl: json['pImageUrl'],
  );

}