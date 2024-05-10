import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/widgets/product_mini_card_widget.dart';

class ProductsGridViewBuilder extends StatelessWidget {
  const ProductsGridViewBuilder({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const Center(
            child: Text(
              'There are no products',
            ),
          )
        : GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ProductMiniCardWidget(product: products[index]);
            },
          );
  }
}
