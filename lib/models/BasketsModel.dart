import 'SallatProducts.dart';

class BasketsModel {
  int id;
  int sallatId;
  int userId;
  int fullTotal;
  String image;
  List<SallatProducts> sallatProducts = [];


  BasketsModel({
    this.id,
    this.userId,
    this.sallatId,
    this.image,
    this.fullTotal,
    this.sallatProducts,
  });

  BasketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullTotal = json['full_total'];
    image = json['image'];
    if (json['sallat_products'] != null) {
      sallatProducts = List<SallatProducts>();
      json['sallat_products'].forEach((v) {
        sallatProducts.add(SallatProducts.fromJson(v));
      });

      print('aldgkjagsdhasd'+sallatProducts.toString());
    }
  }

  Map<String, dynamic> toJsonToBuy()=> {
    
    'id_user': this.userId,
    'id_sallat':this.sallatId,
    
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
