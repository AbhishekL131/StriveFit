import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food.dart';

class FoodLogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Log a new food entry to Firestore
  Future<void> logFood(Food food) async {
    await _firestore.collection('food_logs').add(food.toMap());
  }

  // Get food logs from Firestore
  Stream<List<Food>> getFoodLogs() {
    return _firestore.collection('food_logs').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Food.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList();
    });
  }

  // Delete a food log by document ID
  Future<void> deleteFood(String docId) async {
    await _firestore.collection('food_logs').doc(docId).delete();
  }
}