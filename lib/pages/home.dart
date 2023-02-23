import 'package:ecommerce_app/model/item.dart';
import 'package:ecommerce_app/pages/details_screen.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/shared/appbar.dart';
import 'package:ecommerce_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text(
                    'Mahmoud Youssef',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  accountEmail: Text('mahmoudyoussefsdiek@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/img/mahmoud.jpg'),
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('My products'),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('About'),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                'Developed by Mahmoud Youssef',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text('Home'),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 40,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(product: items[index]),
                    ),
                  );
                },
                child: GridTile(
                  footer: GridTileBar(
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      color: const Color.fromARGB(255, 62, 94, 70),
                      onPressed: () {
                        itemList.add(items[index]);
                        // itemList.calculatePrice(index);
                      },
                    ),
                    leading: Text("\$${items[index].price}"),
                    title: const Text(""),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: -3,
                          bottom: -5,
                          right: 0,
                          left: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(items[index].imgPath),
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
