import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/helper/constants.dart';
import 'package:store/model/product_model.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/widgets/products_grid_builder.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, prefs) {
        return FutureBuilder(
          future: GetAllProducts.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String> favoritesProductId =
                  prefs.data!.getStringList(favorites) ?? [];
              List<ProductModel> favoriteProducts = snapshot.data!.where(
                (currentProduct) {
                  return favoritesProductId
                      .contains(currentProduct.id.toString());
                },
              ).toList();

              return ProductsGridViewBuilder(
                products: favoriteProducts,
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Oops there was an error , try later'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
