class UserDataModel {
  String? name;
  String? age;
  String? address;

  UserDataModel({this.name, this.age, this.address});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['address'] = this.address;
    return data;
  }
}
