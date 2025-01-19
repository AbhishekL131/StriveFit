import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodLogTile extends StatelessWidget {
  final Food food;

  FoodLogTile({required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(245,247,249,1)
      ),
      child: ListTile(
        title: Text(food.name),
        subtitle: Text('${food.calories} kcal'),
      ),
    );
  }
}
