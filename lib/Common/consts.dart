String editableUrl = '192.168.137.182';
String baseUrl = 'http://' + editableUrl + ':8000/api/';
String token = '2|JX7JM19r1UCUHtC3KXtMFXOXomWrIYbmKSMalq99';
String imgUrl = 'http://' + editableUrl + ':8000/upload/image_company/';
String schedUrl =
    'http://' + editableUrl + ':8000/upload/scheduale/scheduale.jpg';
// 2|JX7JM19r1UCUHtC3KXtMFXOXomWrIYbmKSMalq99
// 3|rMx8kNHpgFRHuZv8UXLuHg636pIljgib8ht4lW93
// 15|WRDxa832LltCNkTzpCynwxUBbTQjOEgKJmgyhuzu

int addFree(int quantity, int sale, int addsale) =>
    (quantity ~/ sale * addsale);
double discount(int sale, int addsale, int price) =>
    ((sale * price) / (sale + addsale));
void calcSafi(int quantity, int sale, int addsale, int price, items) {
  addFree(quantity, sale, addsale);
  for (int i = 0; i < quantity % sale; i++) {
    items[i].price = discount(sale, addsale, price);
  }
}
