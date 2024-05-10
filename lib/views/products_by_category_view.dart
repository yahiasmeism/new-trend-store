import 'package:flutter/material.dart';
import 'package:store/model/category_model.dart';
import 'package:store/services/get_category.dart';
import 'package:store/widgets/products_grid_builder.dart';

class ProductsByCategoryView extends StatelessWidget {
  const ProductsByCategoryView({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: FutureBuilder(
        future: GetCategory.get(categoryName: category.title),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProductsGridViewBuilder(products: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Oops there was an Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
