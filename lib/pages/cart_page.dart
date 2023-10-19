import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shop/components/sport_tile.dart';
import 'package:sports_shop/models/sport.dart';
import 'package:sports_shop/models/sport_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Sport sport) {
    Provider.of<SportShop>(context, listen: false).removeItemFromCart(sport);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<SportShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    Sport eachSport = value.userCart[index];
                    return SportTile(
                        sport: eachSport,
                        onPressed: () => removeFromCart(eachSport),
                        icon: const Icon(Icons.delete));
                  },
                ),
              ),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
