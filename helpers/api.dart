import 'package:dio/dio.dart';

final dio = Dio();

Future<Response> api(String url, {String? data}) async {
  final response = await dio.request(
    url,
    data: data,
    options: Options(method: 'method'),
  );
  return response;
}
