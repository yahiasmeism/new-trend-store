import 'package:flutter/material.dart';
import 'package:store/model/category_model.dart';
import 'package:store/pages/products_category_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductsCategoryPage.id,
                arguments: categoryModel,
              );
            },
            child: Container(
              height: 165,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.multiply),
                      fit: BoxFit.fitWidth,
                      image: AssetImage(categoryModel.image))),
              child: Center(
                  child: Text(
                categoryModel.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
