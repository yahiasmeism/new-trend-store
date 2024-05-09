import 'package:store/helper/api.dart';
import 'package:store/model/product_model.dart';

class GetCategory {
  static Future<List<ProductModel>> get({required String categoryName}) async {
    List<dynamic> products = await Api.get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    return products.map((product) {
      return ProductModel.fromJson(product);
    }).toList();
  }
}
