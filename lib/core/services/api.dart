import 'dart:convert';

import 'package:demowallpaper/core/models/image.dart';
import 'package:demowallpaper/core/models/user.dart';
import 'package:dio/dio.dart';

class Api {
  static const String clientId = "Gzr6mHuQx1UdCD0ADwJJ3S0mTY7JaFMQsAf9ZlSv1TU";
  static const endpoint = "https://api.unsplash.com/photos?";

  Dio client = new Dio();

  Future<List<ImageModel>> getAllImages(int page) async {
    var response = await client.get(endpoint, queryParameters: {
      'client_id': clientId,
      'page': page.toString(),
      'per_page': '15'
    });
    List<ImageModel> images = [];
    List<dynamic> responseData = response.data;
    responseData.forEach((element) {
      images.add(ImageModel.fromJson(element));
    });
    return images;
    // Map<String,dynamic> respones = json.decode(response.data);
  }

  Future<User> getUser(String imageId) async {
    var response =
        await client.get(endpoint, queryParameters: {'client_id': clientId});
    List<dynamic> responseData = response.data;
    User user = User.fromJson(
      responseData.firstWhere((element) => element['id'] == imageId)['user'],
    );
    return user;
  }
}
