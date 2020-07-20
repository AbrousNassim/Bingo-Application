import 'package:bingo/model/User.dart';

class Product {
  User user;
  String producteId = '';
  String producteName = 'name';
  String producteDescription = '';
  String producteUrlPic = '';
  int productPrice = 1;
  String productEtat = '';
  var categorie;
  var date;

  Product(
      {this.producteName,
      this.productPrice,
      this.producteId,
      this.productEtat,
      this.categorie,
      this.producteDescription,
      this.producteUrlPic,
      this.date,
      this.user});
}
