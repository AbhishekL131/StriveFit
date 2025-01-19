import 'dart:convert';
import 'package:http/http.dart' as http;

class NutritionService {
  static const String apiKey = '78cfa9726ace75e5cffe828fd7ec4cfe';
  static const String apiId = '7b3d726a';

  Future<Map<String, dynamic>> searchFood(String query) async {
    final url = Uri.parse('https://trackapi.nutritionix.com/v2/natural/nutrients');
    final response = await http.post(
        url,
        headers: {
          'x-app-id': apiId,
          'x-app-key': apiKey,
          'Content-Type': 'application/json'
        },
        body: json.encode({'query': query})
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load food data');
    }
  }
}
