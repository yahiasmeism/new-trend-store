// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/model/category_model.dart';
import 'package:store/widgets/category_tile.dart';

class CategorisView extends StatelessWidget {
  const CategorisView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      title: 'electronics',
      image: 'assets/images/electronics.jpg',
    ),
    CategoryModel(
      title: 'jewelery',
      image: 'assets/images/jewelery.jpg',
    ),
    CategoryModel(
      title: 'men\'s clothing',
      image: 'assets/images/men\'s clothing.jpg',
    ),
    CategoryModel(
      title: 'women\'s clothing',
      image: 'assets/images/women\'s clothing.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}
