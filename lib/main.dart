import 'package:flutter/material.dart';
import 'package:flutter_app/provider/cartProvider.dart';
import 'package:flutter_app/provider/login_provider.dart';
import 'package:flutter_app/provider/productProvider.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/theme.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'view/splash/splashh_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get kTextColor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: theme(),
    //   initialRoute: SplashScreen.routeName,
    //   routes: routes,
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: MaterialApp(
          title: 'IVY moda',
          theme: theme(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getListProduct();
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartList();
    return Container(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          ...productProvider.listProduct.map((e) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    e.image!,
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        e.title!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(e.price!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          cartProvider.addCart(e);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        child: const Text('Th??m v??o gi??? h??ng')),
                  ),
                ],
              ),
            ));
          })
        ],
      ),
    );
  }
}
