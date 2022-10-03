import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details-screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: GestureDetector(
          onTap: press,
          child: SizedBox(
            width: getProportionateScreenWidth(width),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: ProductDetailsArguments(product: product),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // child: Hero(
                      //   tag: product.id.toString(),
                      //   child: Image.asset(product.images[0]),
                      // ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   product.title,
                  //   style: TextStyle(color: Colors.black),
                  //   maxLines: 2,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}