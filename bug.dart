```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the response body
      final jsonData = jsonDecode(response.body);
       // Access data
      print(jsonData['key']);
    } else {
      // Handle error appropriately.  Don't just print the status code.
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception properly.  Don't just print the exception
    print('Error fetching data: $e');
    //Consider rethrowing with more context
    rethrow; 
  }
}
```