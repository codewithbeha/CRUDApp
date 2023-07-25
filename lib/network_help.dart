import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelp {
  Future getData(int id) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/3");
    final result = await http.get(url);
    print(result.statusCode);
    if (result.statusCode == 200) {
      print(result.body);
      return jsonDecode(result.body);
    } else {
      throw Exception("Failed to retrive data: ${result.statusCode}");
    }
  }

  Future insertData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var body = jsonEncode(
      {
        "userId": 1,
        "title": "Lorem Ipsum",
        "body": "Flutter API....",
      },
    );

    final result = await http.post(url, body: body);
    print(result.statusCode);
    if (result.statusCode == 201) {
      print(result.body);
      return jsonDecode(result.body);
    } else {
      throw Exception("Failed to post data: ${result.statusCode}");
    }
  }

  Future updateData(int id) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    var body = jsonEncode(
      {
        "id": id,
        "userId": 1,
        "title": "Lorem Ipsum",
        "body": "Flutter API....",
      },
    );

    final result = await http.put(url, body: body);
    print(result.statusCode);
    if (result.statusCode == 200) {
      print(result.body);
      return jsonDecode(result.body);
    } else {
      throw Exception("Failed to put data: ${result.statusCode}");
    }
  }

  Future deleteData(int id) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    final result = await http.delete(url);
    print(result.statusCode);
    if (result.statusCode == 200) {
      print(result.body);
      return jsonDecode(result.body);
    } else {
      throw Exception("Failed to delete data: ${result.statusCode}");
    }
  }
}
