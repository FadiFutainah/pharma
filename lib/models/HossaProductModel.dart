class HossaProductModel {
  int id;
  int companyId;
  String name;
  int quantity;
  int sale;
  int addSale;
  int price;
  int hossa;

  HossaProductModel(
      {this.id,
      this.companyId,
      this.name,
      this.quantity,
      this.sale,
      this.addSale,
      this.price,
      this.hossa});

  HossaProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['id_company'];
    name = json['name_product'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    price = json['price'];
    hossa = json['tahmel'];
    //nameHossa = json['name_hossa'];
  }
}
