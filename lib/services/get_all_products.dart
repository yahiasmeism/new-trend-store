import 'package:store/helper/api.dart';
import 'package:store/model/product_model.dart';

class GetAllProducts {
  static Future<List<ProductModel>> get() async {
      List<dynamic> products =
          await Api.get(url: 'https://fakestoreapi.com/products');
      return products.map((product) {
        return ProductModel.fromJson(product);
      }).toList();
  }
}
