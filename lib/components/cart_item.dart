import 'package:ecommerce_app/models/sweatshirt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';


class CartItem extends StatefulWidget {
  Sweatshirt sweatshirt;
  CartItem({
    super.key,
    required this.sweatshirt,
  });


  @override
  State<CartItem> createState() => _CartItemState();
}


class _CartItemState extends State<CartItem> {

  // remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemsFromCart(widget.sweatshirt);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffaf0ca),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.sweatshirt.imagePath),
        title: Text(widget.sweatshirt.name),
        subtitle: Text(widget.sweatshirt.price),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
