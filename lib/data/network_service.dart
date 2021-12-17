import 'package:flutter/foundation.dart';
import 'package:photo_list/data/model/mapper/photo_mapper.dart';
import 'package:photo_list/domain/model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkService {
  final String baseUrl;

  NetworkService(this.baseUrl);

  static Map<String, String> getHeaders() {
    return {"accept": "application/json"};
  }

  Future<List<Photo>> getPhotos() async {
    var url = Uri.https(baseUrl, '/photos');

    var response = await http.get(
      url,
      headers: getHeaders(),
    );
    if (response.statusCode == 200) {
      return PhotoMapper.toList(convert.jsonDecode(response.body));
    } else {
      debugPrint('${response.statusCode}');
      throw Exception(response.statusCode);
    }
  }
}
