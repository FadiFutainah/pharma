class SallatProducts {
  int id = 0;
  int sallatId = 0;
  String productsName = '';
  int total = 0;
  int quentity = 0;
  int price = 0;
  String createdAt = '';
  int sale;
  int addSale;
  SallatProducts(
      {this.id,
      this.sale,
      this.productsName,
      this.total,
      this.price,
      this.sallatId,
      this.quentity,
      this.createdAt,
      this.addSale});

  SallatProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsName = json['name_product'];
    total = json['total'];
    price = json['price'];
    sallatId = json['sallat_id'];
    quentity = json['quantity'];
    createdAt = json['created_at'];
    addSale = json['add_sale'];
  }

  Map<String, dynamic> addBasketToJson() => {
        'name_product': productsName,
        'quantity': quentity,
        'price': price,
        'sale': sale,
        'total': total,
        'add_sale': addSale,
      };
}
