import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/payment_pages/shipment_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart.dart';
import '../models/sweatshirt.dart';
import 'dart:convert';

class CartPage extends StatelessWidget {
  final Sweatshirt? sweatshirt;

  const CartPage({Key? key, this.sweatshirt}) : super(key: key);

  Future<void> _saveCart(List<Sweatshirt> cart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJson = cart.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('cart', cartJson);
  }

  Future<List<Sweatshirt>> _loadCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      return cartJson.map((item) => Sweatshirt.fromJson(jsonDecode(item))).toList();
    } else {
      return [];
    }
  }

  double calculateTotalPrice(List<Sweatshirt> cart) {
    double total = 0.0;
    for (var item in cart) {
      total += double.parse(item.price);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Color(0xfffaf0ca)), // Set text color to a contrasting color
        ),
        backgroundColor: Color(0xff0d3b66), // Set app bar background color
        elevation: 0, // Remove app bar elevation
        iconTheme: IconThemeData(color: Colors.black), // Set icon color to black
      ),
      body: FutureBuilder<List<Sweatshirt>>(
        future: _loadCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading cart'));
          } else {
            List<Sweatshirt> initialCart = snapshot.data ?? [];
            context.read<Cart>().setCart(initialCart);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  if (sweatshirt != null)
                    Text(
                      'Sweatshirt: ${sweatshirt!.name}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Consumer<Cart>(
                      builder: (context, cart, child) {
                        double totalPrice = calculateTotalPrice(cart.getUserCart());

                        // Save the cart whenever it changes
                        _saveCart(cart.getUserCart());

                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: cart.getUserCart().length,
                                itemBuilder: (context, index) {
                                  Sweatshirt individualSweatshirt = cart.getUserCart()[index];
                                  return CartItem(sweatshirt: individualSweatshirt);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Subtotal: \$${totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfffaf0ca),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Checkout button clicked",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Color(0xff0d3b66),
                          fontSize: 16.0,
                        );

                        // Navigate to ShipmentPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShipmentPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Color(0xfffaf0ca),
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0d3b66),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      backgroundColor: Color(0xff0d3b66), // Set page background color
    );
  }
}
