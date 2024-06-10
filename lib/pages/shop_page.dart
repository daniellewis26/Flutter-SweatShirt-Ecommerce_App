import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/sweatshirt.dart';
import 'package:ecommerce_app/pages/see_all_vertically_page.dart';
import 'package:ecommerce_app/components/sweatshirt_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  // add sweatshirt to cart
  void addSweatshirtToCart(Sweatshirt sweatshirt) {
    Provider.of<Cart>(context, listen: false).addItemsToCart(sweatshirt);

    // alert the user, show successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Color(0xfffaf0ca),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Color(0xff0d3b66)),
                suffixIcon: Icon(Icons.search, color: Color(0xff0d3b66)),
                border: InputBorder.none,
              ),
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Life is too short for boring shirts! \n Stretch your style, not your budget',
              style: TextStyle(color: Colors.white),
            ),
          ),

          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                      color: Color(0xfffaf0ca)
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to a new page to display all sweatshirts vertically
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeeAllVerticallyPage()),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffaf0ca),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // list of sweatshirt for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.getSweatshirtList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a sweatshirt from shop list
                Sweatshirt sweatshirt = value.getSweatshirtList()[index];

                // filter sweatshirts based on search query
                if (sweatshirt.name.toLowerCase().contains(searchQuery)) {
                  // return the sweatshirt tile if it matches the search query
                  return SweatshirtTile(
                    sweatshirt: sweatshirt,
                    onTap: () => addSweatshirtToCart(sweatshirt),
                  );
                } else {
                  // return an empty container if the sweatshirt does not match the search query
                  return Container();
                }
              },
            ),
          ),

          const Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Color(0xfffaf0ca),
            ),
          ),
        ],
      ),
    );
  }
}
