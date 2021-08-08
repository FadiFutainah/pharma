class CompanyModel {
  int id;
  String name;
  String image;

  // String logo;
  // List<Product> products;

  CompanyModel({
    this.id,
    this.name,
    this.image,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_company'];
    image = json['image'];

    ///Products = Product.fromJson(json["products object"])
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
