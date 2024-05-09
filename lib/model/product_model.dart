import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/helper/constants.dart';

class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rataing;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rataing});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rataing: RatingModel.fromJson(
        jsonData['rating'],
      ),
    );
  }

  bool isFavorite({required SharedPreferences? prefs}) {
    return prefs?.getStringList(favorites)?.contains(id.toString()) ?? false;
  }

  addToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsFavorite = prefs.getStringList(favorites) ?? [];
    if (!productsFavorite.contains(id.toString())) {
      productsFavorite.add(id.toString());
      await prefs.setStringList(favorites, productsFavorite);
    }
  }

  removeFromFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsFavorite = prefs.getStringList(favorites) ?? [];
    if (productsFavorite.contains(id.toString())) {
      productsFavorite.remove(id.toString());
      await prefs.setStringList(favorites, productsFavorite);
    }
  }
}

class RatingModel {
  final double rate;

  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'],
    );
  }
}
