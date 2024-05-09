import 'package:flutter/material.dart';
import 'package:store/helper/constants.dart';
import 'package:store/tabs/favorite_tab.dart';
import 'package:store/tabs/products_builder_tab.dart';
import 'package:store/tabs/categories_tab.dart';
import 'package:store/tabs/settings_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'NEW TREND',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(
                Icons.shopping_cart,
                size: 40,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: TabBar(
        indicatorColor: kPrimaryColor,
        labelColor: kPrimaryColor,
        unselectedLabelColor: Colors.grey,
        controller: _tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            child: Text(
              'Home',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            icon: Icon(Icons.category),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            icon: Icon(Icons.favorite),
            child: Text(
              'Favorites',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            icon: Icon(Icons.settings),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProductsBuilderTab(),
          CategorisTab(),
          FavoriteTab(),
          SettingsTab(),
        ],
      ),
    );
  }
}
