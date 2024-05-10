import 'package:flutter/material.dart';
import 'package:store/helper/constants.dart';
import 'package:store/views/custom_tab_bar_view.dart';

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
      home: const CustomTabBarView(),
    );
  }
}
