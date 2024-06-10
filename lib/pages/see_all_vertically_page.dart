import 'package:ecommerce_app/models/sweatshirt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../components/sweatshirt_tile.dart';
import 'cart_page.dart';

class SeeAllVerticallyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d3b66),
      appBar: AppBar(
        backgroundColor: Color(0xff0d3b66),
        title: Text(
          'All Sweatshirts',
          style: TextStyle(color: Color(0xfffaf0ca)),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.getSweatshirtList().length,
          itemBuilder: (context, index) {
            Sweatshirt sweatshirt = value.getSweatshirtList()[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding values as needed
              child: SweatshirtTile(
                sweatshirt: sweatshirt,
                onTap: () {
                  // Add the sweatshirt to the cart before navigating to CartPage
                  Provider.of<Cart>(context, listen: false).addItemsToCart(sweatshirt);
                  // Navigate to the CartPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(sweatshirt: sweatshirt)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
