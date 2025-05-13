import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../providers/theme_provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedCategory = 'All';
  String _priceFilter = 'All';

  final List<String> categories = [
    'All',
    'Burgers',
    'Pizzas',
    'Fries',
    'Drinks',
  ];

  final List<String> priceFilters = [
    'All',
    'Under ₹100',
    '₹100 - ₹200',
    '₹200 - ₹300',
    'Above ₹300',
  ];

  List<Product> get filteredProducts {
    List<Product> products = Product.menuItems;

    if (_selectedCategory != 'All') {
      products = products.where((product) {
        return product.name
            .toLowerCase()
            .contains(_selectedCategory.toLowerCase());
      }).toList();
    }

    if (_priceFilter != 'All') {
      products = products.where((product) {
        switch (_priceFilter) {
          case 'Under ₹100':
            return product.price < 100;
          case '₹100 - ₹200':
            return product.price >= 100 && product.price <= 200;
          case '₹200 - ₹300':
            return product.price >= 200 && product.price <= 300;
          case 'Above ₹300':
            return product.price > 300;
          default:
            return true;
        }
      }).toList();
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor:
                        isDarkMode ? Colors.white12 : Colors.grey[200],
                    selectedColor: Colors.orange,
                    labelStyle: TextStyle(
                      color: _selectedCategory == category
                          ? Colors.white
                          : isDarkMode
                              ? Colors.white70
                              : Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          // Price Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: priceFilters.length,
              itemBuilder: (context, index) {
                final priceFilter = priceFilters[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(priceFilter),
                    selected: _priceFilter == priceFilter,
                    onSelected: (selected) {
                      setState(() {
                        _priceFilter = priceFilter;
                      });
                    },
                    backgroundColor:
                        isDarkMode ? Colors.white12 : Colors.grey[200],
                    selectedColor: Colors.orange,
                    labelStyle: TextStyle(
                      color: _priceFilter == priceFilter
                          ? Colors.white
                          : isDarkMode
                              ? Colors.white70
                              : Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          // Products Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
