import 'SallatProducts.dart';

class BasketsModel {
  int id = 0;
  String sallatName = '';
  int fullTotal = 0;
  int num = 0;
  int userId = 0;
  List<SallatProducts> sallatProducts = [];

  BasketsModel({
    this.id,
    this.userId,
    this.sallatName,
    this.sallatProducts,
    this.num,
    this.fullTotal,
  });

  BasketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sallatName = json['name'];
    fullTotal = json['full_total'];
    num = json['num'];
    if (json['sallat_products'] != null) {
      sallatProducts = [];
      json['sallat_products'].forEach((v) {
        sallatProducts.add(SallatProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJsonToBuy() => {
        'id_user': this.userId,
        'sallat_id': this.id,
      };

  /*Map<String, dynamic> toJson() {
    
    List<Map<String, dynamic>> test = List<Map<String, dynamic>>();
    
    if (this.products != null) {
      this.products.forEach((v) {
        test.add(v.toJson1());
      });
    }

    Map<String, dynamic> map = {
      'id_user': this.UserId,
      'full_total': this.fullTotal,
      'id_product': test,
    };

    return map;
  }*/
}
