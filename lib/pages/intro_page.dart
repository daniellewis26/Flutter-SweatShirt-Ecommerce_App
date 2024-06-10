import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0d3b66), Color(0xFFfaf0ca)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'lib/images/logo.png',
                      height: 300,
                      width: 300,
                    ),
                  ),

                  const SizedBox(height: 5.0),

                  // title
                  const Text(
                    'Just Do It',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff0d3b66),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // sub title
                  const Text(
                    'Brand new Sweatshirt with many colors',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0d3b66),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // start now button
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff0d3b66),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: const Center(
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Color(0xfffaf0ca),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
