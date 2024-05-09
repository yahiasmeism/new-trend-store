import 'package:flutter/material.dart';
import 'package:store/helper/constants.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/product_details_page.dart';
import 'package:store/pages/products_category_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: kPrimaryColor, useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        ProductsCategoryPage.id: (context) => const ProductsCategoryPage(),
        ProductDetailsPage.id: (context) => const ProductDetailsPage(),
      },
    );
  }
}
