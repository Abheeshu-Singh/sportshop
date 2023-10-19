import 'package:flutter/material.dart';
import 'package:sports_shop/models/sport.dart';

class SportShop extends ChangeNotifier {
  final List<Sport> _shop = [
    Sport(
        name: 'Basket Ball',
        price: 'Rs 450',
        imagePath: "lib/images/basket-ball.png"),
    Sport(
        name: 'Boomerang',
        price: 'Rs 450',
        imagePath: "lib/images/boomerang.png"),
    Sport(name: 'Rugby', price: 'Rs 450', imagePath: "lib/images/rugby.png"),
    Sport(
        name: 'Tennis Ball',
        price: 'Rs 450',
        imagePath: "lib/images/tennis-ball.png"),
  ];

  List<Sport> _userCart = [];
  List<Sport> get sportShop => _shop;
  List<Sport> get userCart => _userCart;

  void addItemToCart(Sport sport) {
    _userCart.add(sport);
    notifyListeners();
  }

  void removeItemFromCart(Sport sport) {
    _userCart.remove(sport);
  }
}
