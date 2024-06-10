import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'sweatshirt.dart';

class Cart extends ChangeNotifier {
  // list of sweatshirt for sales
  List<Sweatshirt> sweatshirtShop = [
    Sweatshirt(
      name: 'Black Sweatshirt',
      price: '36.19',
      description: 'Snug Wear EZwear Slogan Graphic Kangaroo Pocket Thermal Lined Drawstring',
      imagePath: 'lib/images/Black Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Blue Sweatshirt',
      price: '38.23',
      description: 'Snug Wear Slogan Graphic Kangaroo Pocket Thermal Lined Drawstring',
      imagePath: 'lib/images/Blue Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Brown Sweatshirt',
      price: '16.55',
      description: 'Snug Wear Qutie Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/Brown Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Light Blue Sweatshirt',
      price: '23.64',
      description: 'Women Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/Light Blue Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Navy Blue Sweatshirt',
      price: '20.19',
      description: 'Snug Wear Essnce Floral & Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/Navy Blue Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Pink Sweatshirt',
      price: '43.54',
      description: 'Women Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/Pink Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'Sweatshirt',
      price: '23.14',
      description: 'Women Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/Sweatshirt.jpeg',
    ),
    Sweatshirt(
      name: 'White Sweatshirt',
      price: '14.23',
      description: 'Women Letter Graphic Thermal Lined Sweatshirt',
      imagePath: 'lib/images/White Sweatshirt.jpeg',
    ),
  ];

  // list of items in user cart
  List<Sweatshirt> userCart = [];

  // get list of Sweatshirt for sale
  List<Sweatshirt> getSweatshirtList() {
    return sweatshirtShop;
  }

  // get cart
  List<Sweatshirt> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemsToCart(Sweatshirt sweatshirt) {
    userCart.add(sweatshirt);
    notifyListeners();
    _saveCart();
  }

  // remove item from cart
  void removeItemsFromCart(Sweatshirt sweatshirt) {
    userCart.remove(sweatshirt);
    notifyListeners();
    _saveCart();
  }

  // save cart to SharedPreferences
  Future<void> _saveCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJson = userCart.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('cart', cartJson);
  }

  // load cart from SharedPreferences
  Future<void> loadCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      try {
        userCart = cartJson.map((item) {
          return Sweatshirt.fromJson(jsonDecode(item));
        }).toList();
        notifyListeners();
      } catch (e) {
        // Log the error or display a message to the user
        print('Error loading cart: $e');
      }
    }
  }

  // set cart (useful for initialization)
  void setCart(List<Sweatshirt> cart) {
    userCart = cart;
    notifyListeners();
  }
}
