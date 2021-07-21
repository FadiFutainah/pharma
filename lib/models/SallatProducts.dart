class SallatProducts {
  int id = 0;
  int sallatId = 0;
  String productsName = '';
  int total = 0;
  int quentity = 0;
  int price = 0;
  String createdAt = '';

  SallatProducts({
    this.id,
    this.productsName,
    this.total,
    this.price,
    this.sallatId,
    this.quentity,
    this.createdAt
  });

  SallatProducts.fromJson(Map<String, dynamic>json){
    id = json['id'];
    productsName = json['name_product'];
    total = json['total'];
    price = json['price'];
    sallatId = json['sallat_id'];
    quentity = json['quantity'];
    createdAt = json['created_at'];
  }

  


  /*Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'price': this.price,
        'quantity': this.quantity,
        'createdAt': this.createdAt,
        'sale': this.sale,
        'addSale': this.addSale,
        'hossa': this.hossa,
        
      };*/              
  
}