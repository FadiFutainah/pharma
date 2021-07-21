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
// {
//     "id": 1,
//     "name": "fofo",
//     "products": [
//         {
//             "id": 1,
//             "name": "fofo",
//             "formation": "rara",
//             "addedDate": "1/1/1",
//             "max": 100,
//             "price": 12.23,
//             "quantity": 99,
//             "alternatives": [
//                 "koko",
//                 "toto",
//                 "soso"
//             ]
//         },
//         {
//             "id": 2,
//             "name": "fofo",
//             "formation": "rara",
//             "addedDate": "1/1/1",
//             "max": 100,
//             "price": 12.23,
//             "quantity": 99,
//             "alternatives": [
//                 "koko",
//                 "toto",
//                 "soso"
//             ]
//         }
//     ]
// }