import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/helper/constants.dart';
import 'package:store/model/product_model.dart';
import 'package:store/widgets/product_detail_card_widget.dart';
import 'package:store/widgets/stars_rate.dart';

import '../widgets/custom_cupertino_button.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  SharedPreferences? prefs;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomCupertinoButton(
              icon: const Icon(Icons.arrow_back),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          toolbarHeight: 70,
          leadingWidth: 70,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Detail Product',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              ProductDetailCardWidget(product: widget.product),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        widget.product.description,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add_shopping_cart),
                      Text(
                        widget.product.rataing.count.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  StarsRate(
                    rate: widget.product.rataing.rate,
                    size: 30,
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(14),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
