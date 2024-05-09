import 'package:store/helper/api.dart';

class AddProduct {
  static Future<Map<String, dynamic>> add({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> product = await Api.post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category
      },
    );

    return product;
  }
}
