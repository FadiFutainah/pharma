

/*class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}*/


class UserModel {
  final int id;
  final String name_pharmacy;
  final String name;
  final String address;
  final String mobile_phone;
  final String phone;
  final String password;
  final bool remember_token;
  final DateTime created_at;
  final DateTime updated_at;

  

  UserModel({
    this.id,
    this.name_pharmacy,
    this.name,
    this.address,
    this.mobile_phone,
    this.phone,
    this.password,
    this.remember_token,
    this.created_at,
    this.updated_at,
  });

 int get getId => this.id;


  get namepharmacy => this.name_pharmacy;


  get getName => this.name;


  get getAddress => this.address;


  get mobilephone => this.mobile_phone;


  get getPhone => this.phone;


  get getPassword => this.password;


  get remembertoken => this.remember_token;


  get createdat => this.created_at;

  get updatedat => this.updated_at;



 factory UserModel.fromJson(Map<String, dynamic> json){
   return UserModel(
     id:json['id'],
     name: json['name'],
     name_pharmacy: json['name_pharmacy'],
     password: json['password'],
     address: json['address'],
     phone: json['phone'],
     mobile_phone: json['mobile_phone'],
     remember_token: json['remember_token'],
     created_at: json['created_at'],
     updated_at: json['updated_at'],

   );

 }

 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_pharmacy'] = this.name_pharmacy;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile_phone'] = this.mobile_phone;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['remember_token'] = this.remember_token;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
