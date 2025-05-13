class Product {
  final String name;
  final double price;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  static List<Product> menuItems = [
    Product(
      name: "Cheese Burst Burger",
      price: 149,
      description:
          "A juicy burger with double cheese, fresh veggies, and a soft bun.",
      image: "assets/cheese_burger.png",
    ),
    Product(
      name: "Spicy Chicken Burger",
      price: 179,
      description: "Spicy grilled chicken patty with lettuce & mayo.",
      image: "assets/burger3.png",
    ),
    Product(
      name: "Veg Supreme Burger",
      price: 249,
      description: "A crispy veg patty loaded with cheese & fresh veggies.",
      image: "assets/burger4.png",
    ),
    Product(
      name: "Veg Supreme Pizza",
      price: 299,
      description: "Loaded with fresh veggies and extra cheese.",
      image: "assets/pizza3.png",
    ),
    Product(
      name: "Non Veg Supreme Pizza",
      price: 349,
      description: "Loaded with chicken, sausage, and extra cheese.",
      image: "assets/pizza3.png",
    ),
    Product(
      name: "Margherita Pizza",
      price: 199,
      description: "Classic pizza with tomato sauce and mozzarella.",
      image: "assets/pizza3.png",
    ),
    Product(
      name: "French Fries",
      price: 99,
      description: "Crispy golden fries with seasoning.",
      image: "assets/fries.png",
    ),
    Product(
      name: "Coca Cola",
      price: 60,
      description: "Refreshing cold drink.",
      image: "assets/coke.png",
    ),
  ];
}
