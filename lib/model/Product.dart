import 'package:bingo/model/User.dart';

class Product {
  User user;
  String producteId = '';
  String producteName = 'name';
  String producteDescription = '';
  String producteUrlPic1 = '';
  String producteUrlPic2 = '';
  String producteUrlPic3 = '';
  String producteUrlPic4 = '';
  int productPrice = 1;
  String productEtat = '';
  var categorie;
  var date;
  bool isLiked = false;
  var methodeDePaiment;

  Product(
      {this.producteName,
      this.productPrice,
      this.producteId,
      this.productEtat,
      this.categorie,
      this.producteDescription,
      this.producteUrlPic1,
      this.producteUrlPic2,
      this.producteUrlPic3,
      this.producteUrlPic4,
      this.date,
      this.isLiked,
      this.methodeDePaiment,
      this.user});
}
