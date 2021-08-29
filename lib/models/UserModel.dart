class UserModel {
  int id;
  String name;
  String pharmacyName;
  String address;
  String mobilePhone;
  String phone;
  String password;
  String createdAt;
  String updatedAt;

  UserModel({
    this.id,
    this.name,
    this.pharmacyName,
    this.address,
    this.mobilePhone,
    this.phone,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pharmacyName = json['name_pharmacy'];
    address = json['address'];
    // mobilePhone = json['mobile_phone'];
    // phone = json['phone'];
    // password = json['password'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_pharmcy'] = this.pharmacyName;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile_phone'] = this.mobilePhone;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, pharmacyName: $pharmacyName, address: $address, mobilePhone: $mobilePhone, phone: $phone, password: $password, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
