class PivotModel {

  int billId;
  int productId;
  int total;
  int quentityToBoughtBySpeceficUser;  

  int get getTotal => this.total;

  PivotModel({
    this.billId,
    this.productId,
    this.total,
    this.quentityToBoughtBySpeceficUser,
  });


  PivotModel.fromJson(Map<String, dynamic>json){
    billId = json['id_bill'];
        productId = json['id_product'];
        total = json['total'];
        quentityToBoughtBySpeceficUser = json['quantity_to_bought_by_specefic_user'];
  }


  Map<String, dynamic> toJson() => {
        'id_product': this.productId,
        'quantity_to_bought_by_specefic_user':this.quentityToBoughtBySpeceficUser,
      };

  Map<String, dynamic> toJson1() => {
        'total': this.total,
      };

  Map<String, dynamic> toJson2() => {
        'quantity_to_bought_by_specefic_user':this.quentityToBoughtBySpeceficUser,
      };        

}