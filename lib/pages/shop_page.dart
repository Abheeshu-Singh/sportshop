import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shop/components/sport_tile.dart';
import 'package:sports_shop/models/sport.dart';
import 'package:sports_shop/models/sport_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Sport sport) {
    Provider.of<SportShop>(context, listen: false).addItemToCart(sport);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to the cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SportShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'What would you like to shop?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.sportShop.length,
                  itemBuilder: (BuildContext context, int index) {
                    Sport eachSport = value.sportShop[index];
                    return SportTile(
                      sport: eachSport,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(eachSport),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
