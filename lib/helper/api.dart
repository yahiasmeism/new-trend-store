import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get({required String url}) async {
    // Send the request and wait for the response
      http.Response response = await http.get(Uri.parse(url));
      // Check response status
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'There is a problem with status code: ${response.statusCode} with body:  ${response.body}');
      }
  }

  static Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> header = {
      "Content-Type": "application/x-www-form-urlencoded"
    };

    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    log(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code: ${response.statusCode} with body:  ${response.body}');
    }
  }
}
