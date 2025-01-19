class Food {
  final String id; // Unique ID for the food entry (for deletion)
  final String name;
  final String calories; // Store calories as a string
  final String timestamp; // Store timestamp as a string

  // Constructor including id
  Food({
    required this.id,
    required this.name,
    required this.calories,
    required this.timestamp,
  });

  // Convert Food object to a Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include id in the map
      'name': name,
      'calories': calories,
      'timestamp': timestamp,
    };
  }

  // Factory method to create a Food object from a Map
  factory Food.fromMap(String docId, Map<String, dynamic> map) {
    return Food(
      id: docId, // Use document ID from Firebase
      name: map['name'] ?? '',
      calories: map['calories']?.toString() ?? '0', // Ensure calories is a string
      timestamp: map['timestamp'] ?? DateTime.now().toString(), // Handle timestamp
    );
  }

  // Optional: Method to parse the timestamp to DateTime
  DateTime getParsedTimestamp() {
    return DateTime.tryParse(timestamp) ?? DateTime.now();
  }
}