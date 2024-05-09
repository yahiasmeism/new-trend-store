import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/helper/constants.dart';
import 'package:store/model/product_model.dart';

import '../widgets/custom_cupertino_button.dart';

class ProductDetailCardWidget extends StatefulWidget {
  const ProductDetailCardWidget({super.key, required this.product});
  static const id = 'ProductLargeCardWidget';
  final ProductModel product;
  @override
  State<ProductDetailCardWidget> createState() =>
      _ProductDetailCardWidgetState();
}

class _ProductDetailCardWidgetState extends State<ProductDetailCardWidget> {
  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();
    fetchProductsFavorite().then((data) {
      setState(() {
        prefs = data;
      });
    });
  }

  Future<SharedPreferences?> fetchProductsFavorite() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kPrimaryColor[50],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                width: 400,
                height: 300,
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                ),
              ),
              Positioned(
                right: 14,
                top: 12,
                child: CustomCupertinoButton(
                  color: widget.product.isFavorite(prefs: prefs)
                      ? Colors.red
                      : Colors.grey,
                  onPressed: () {
                    if (!widget.product.isFavorite(prefs: prefs)) {
                      widget.product.addToFavorites();
                    } else {
                      widget.product.removeFromFavorites();
                    }
                    setState(() {});
                  },
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  widget.product.title.split(' ').length > 3
                      ? widget.product.title.split(' ').sublist(0, 3).join(' ')
                      : widget.product.title,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '\$ ${widget.product.price.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
