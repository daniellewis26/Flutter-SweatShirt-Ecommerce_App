import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardPaymentPage extends StatefulWidget {
  @override
  _CardPaymentPageState createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf0ca),
      appBar: AppBar(
        backgroundColor: Color(0xfffaf0ca),
        title: Text('Debit / Credit Card',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(labelText: 'Expiry Date'),
            ),
            TextField(
              controller: _cvvController,
              decoration: InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _cardNumberController.clear();
                    _expiryDateController.clear();
                    _cvvController.clear();
                    _nameController.clear();
                    Fluttertoast.showToast(
                        msg: "Payment Info Cleared",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.yellow,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text('Cancel Payment',
                    style: TextStyle(color: Color(0xfffaf0ca)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0d3b66),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Payment Initiated",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text('Pay Now',
                    style: TextStyle(color: Color(0xfffaf0ca)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0d3b66),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
