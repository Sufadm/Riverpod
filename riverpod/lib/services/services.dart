import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpodproject/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpodproject/model/task_model.dart';

class ApiService {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await http.get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiService>((ref) => ApiService());

// another method---------------------------------------------------
class Apidata {
  List<Task> tasklist = [];
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<void> fetchdata() async {
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      tasklist = data.map((e) => Task.fromJson(e)).toList();
    }
  }
}

final taskUserData = Provider<Apidata>((ref) => Apidata());
