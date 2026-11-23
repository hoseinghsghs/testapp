import 'dart:io';

import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  final response = await dio.get('http://127.0.0.1:8000/api/products');

  stdout.writeln(response.data);
}
