String editableUrl = '192.168.1.5';
String baseUrl = 'http://' + editableUrl + ':8000/api/';
String token = '20|E2PDKOVcNciDn8MLkcnVd3Pc5VzEY5XOCN83kqBG';
String imgUrl = 'http://' + editableUrl + ':8000/upload/image_company/';
String schedUrl =
    'http://' + editableUrl + ':8000/upload/scheduale/scheduale.jpg';
// 23|J5Z5iLGFWZTXqZrc5ka5WsRV1wVdXxVaIsfeHLH8
// 20|E2PDKOVcNciDn8MLkcnVd3Pc5VzEY5XOCN83kqBG

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
