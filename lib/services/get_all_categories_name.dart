import 'package:store/helper/api.dart';

class GetAllCategoriesName {
  static Future<List<dynamic>> get() async {
    return await Api.get(url: 'https://fakestoreapi.com/products/categories');
  }
}
