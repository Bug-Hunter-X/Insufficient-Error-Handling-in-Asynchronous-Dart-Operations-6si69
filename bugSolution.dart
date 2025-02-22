```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['key']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
    rethrow;
  } on FormatException catch (e) {
    print('JSON format error: $e');
    rethrow;
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow;
  }
}
```