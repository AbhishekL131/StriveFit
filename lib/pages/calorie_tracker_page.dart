import 'package:flutter/material.dart';
import '../services/food_log_service.dart';
import '../models/food.dart';

class CalorieTrackerPage extends StatelessWidget {
  final FoodLogService _foodLogService = FoodLogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Calorie Tracker',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF003366),
      ),
      body: StreamBuilder<List<Food>>(
        stream: _foodLogService.getFoodLogs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final List<Food> foodLogs = snapshot.data!;

          final int totalCalories = foodLogs.fold(0, (sum, food) {
            return sum + (int.tryParse(food.calories) ?? 0); // Safely parse to int
          });

          if (foodLogs.isEmpty) {
            return Center(
              child: Text(
                'No food logged yet!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Total Calories: totalCalories kcal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: foodLogs.length,
                  itemBuilder: (context, index) {
                    final Food food = foodLogs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(216, 240, 253, 1),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            food.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text('${food.calories} kcal'),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle_outline, color: Colors.black),
                            onPressed: () {
                              _foodLogService.deleteFood(food.id); // Delete entry
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}