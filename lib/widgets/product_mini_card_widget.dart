import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/pages/product_details_page.dart';
import 'package:store/widgets/custom_cupertino_button.dart';

class ProductMiniCardWidget extends StatefulWidget {
  const ProductMiniCardWidget({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductMiniCardWidget> createState() => _ProductMiniCardWidgetState();
}

//
class _ProductMiniCardWidgetState extends State<ProductMiniCardWidget> {
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
    return GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsPage.id,
              arguments: widget.product);
          setState(() {});
        },
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              color: Color.fromARGB(255, 180, 180, 180),
            )
          ]),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CachedNetworkImage(
                    width: 100,
                    height: 100,
                    fadeInCurve: Curves.easeInOut,
                    imageUrl: widget.product.image,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.product.title,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 44, 44, 44)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CustomCupertinoButton(
                          onPressed: () async {
                            bool isFavorite =
                                widget.product.isFavorite(prefs: prefs!);
                            if (!isFavorite) {
                              widget.product.addToFavorites();
                            } else {
                              widget.product.removeFromFavorites();
                            }
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            size: 18,
                          ),
                          color: widget.product.isFavorite(prefs: prefs)
                              ? Colors.red
                              : Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
