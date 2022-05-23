import 'package:http/http.dart' as http;

class ApiBaseHelper {
  static Future<String> fetchRepository({String? userName}) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/${userName}/repos'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      Exception('Error Occurred');
    }
    return response.body;
  }

  static Future<String> fetchUserData({String? userName}) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/${userName}'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      Exception('Error Occurred');
    }
    return response.body;
  }
}
