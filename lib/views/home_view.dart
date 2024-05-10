import 'package:flutter/material.dart';
import 'package:store/services/get_all_products.dart';

import '../widgets/products_grid_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllProducts.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductsGridViewBuilder(
            products: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Oops , there was an error , try later'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
