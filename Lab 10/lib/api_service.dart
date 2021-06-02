import 'package:http/http.dart' as http;
import 'package:madlab10/model/api_model.dart';
import 'dart:convert';

Future <List<apiModel>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  if (response.statusCode == 200) {
    List<apiModel> list = [];
    json.decode(response.body).forEach((item){list.add(apiModel.fromJson(item));});
    return list;
  } else {
    throw Error();
  }
}
