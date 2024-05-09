import 'package:flutter/material.dart';
import 'package:store/model/category_model.dart';
import 'package:store/services/get_category.dart';
import 'package:store/widgets/products_grid_view.dart';

class ProductsCategoryPage extends StatelessWidget {
  const ProductsCategoryPage({super.key});

  static const id = 'ProductsCategoryPage';
  @override
  Widget build(BuildContext context) {
    CategoryModel categoryModel =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
      ),
      body: FutureBuilder(
        future: GetCategory.get(categoryName: categoryModel.title),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProductsGridView(products: snapshot.data!);
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
