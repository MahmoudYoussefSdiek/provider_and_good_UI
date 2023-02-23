import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/shared/appbar.dart';
import 'package:ecommerce_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text('Checkout Screen'),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  //padding: EdgeInsets.all(8),
                  itemCount: itemList.selectedItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(itemList.selectedItems[index].name),
                        subtitle: Text(
                            '${itemList.selectedItems[index].price} - ${itemList.selectedItems[index].location}'),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(itemList.selectedItems[index].imgPath),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              itemList
                                  .removeItem(itemList.selectedItems[index]);
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnPink),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Text(
              'Pay \$${itemList.itemsPrices.round()}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
