import 'package:flutter/material.dart';
import '../models/sweatshirt.dart';

class SweatshirtTile extends StatelessWidget {
  final Sweatshirt sweatshirt;
  final VoidCallback onTap;

  const SweatshirtTile({
    Key? key,
    required this.sweatshirt,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Color(0xfffaf0ca),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sweatshirt image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(sweatshirt.imagePath),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                sweatshirt.description,
                style: TextStyle(color: Color(0xff0d3b66)),
              ),
            ),

            // Price + Details
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 15), // Added bottom padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sweatshirt name
                      Text(
                        sweatshirt.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Price
                      Text(
                        '\$' + sweatshirt.price,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Plus button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
