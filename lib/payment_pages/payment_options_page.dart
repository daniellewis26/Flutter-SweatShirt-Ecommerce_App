import 'package:flutter/material.dart';
import 'card_payment_page.dart';

class PaymentOptionsPage extends StatefulWidget {
  @override
  _PaymentOptionsPageState createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf0ca),
      appBar: AppBar(
        backgroundColor: Color(0xfffaf0ca),
        title: Text('Choose Payment Option',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Debit / Credit card'),
            trailing: Icon(Icons.credit_card),
            selected: selectedOption == 'card',
            onTap: () {
              setState(() {
                selectedOption = 'card';
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardPaymentPage()),
              );
            },
          ),
          ListTile(
            title: Text('Internet Banking'),
            trailing: Icon(Icons.account_balance),
            selected: selectedOption == 'bank',
            onTap: () {
              setState(() {
                selectedOption = 'bank';
              });
            },
          ),
          ListTile(
            title: Text('GPay'),
            trailing: Icon(Icons.phone_android),
            selected: selectedOption == 'gpay',
            onTap: () {
              setState(() {
                selectedOption = 'gpay';
              });
            },
          ),
          ListTile(
            title: Text('PhonePe'),
            trailing: Icon(Icons.phone_android),
            selected: selectedOption == 'phonepe',
            onTap: () {
              setState(() {
                selectedOption = 'phonepe';
              });
            },
          ),
        ],
      ),
    );
  }
}