import 'package:flutter/material.dart';
import 'package:store_app/Models/product_and_rating_model.dart';
import 'package:store_app/Screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product, super.key});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, UpdateProductPage.id , arguments: product);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(1, 1))
              ]),
              child: Card(
                color: Colors.white,
                shape: const BeveledRectangleBorder(),
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${product.price.toString()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ])
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 32,
              top: -60,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
