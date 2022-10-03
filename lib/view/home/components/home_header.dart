import 'package:flutter/material.dart';
import 'package:flutter_app/view/cart/cart_screen.dart';
import 'package:flutter_app/view/home/components/icon_btn_with_counter.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import '../../../constants.dart';
import '../../../provider/cartProvider.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartList();

    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                      vertical: getProportionateScreenWidth(9)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "TÌM KIẾM SẢN PHẨM",
                  prefixIcon: Icon(Icons.catching_pokemon)),
            ),
          ),
          IconBtnWithCounter(
            // badgeContent: Text(cartProvider.cart.length.toString()),
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
            //  Navigator.pushNamed(context, CartScreen.routeName)
          ),
        ],
      ),
    );
  }
}
