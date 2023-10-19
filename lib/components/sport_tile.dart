import 'package:flutter/material.dart';
import 'package:sports_shop/models/sport.dart';

// ignore: must_be_immutable
class SportTile extends StatelessWidget {
  final Sport sport;
  void Function()? onPressed;
  final Widget icon;
  SportTile({
    super.key,
    required this.sport,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(sport.name),
        subtitle: Text(sport.price),
        leading: Image.asset(sport.imagePath),
        trailing: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
