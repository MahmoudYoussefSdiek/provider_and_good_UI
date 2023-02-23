import 'package:ecommerce_app/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Item> selectedItems = [];
  double itemsPrices = 0;

  add(Item product) {
    selectedItems.add(product);
    itemsPrices += product.price;
    notifyListeners();
  }

  removeItem(Item product) {
    selectedItems.remove(product);
    itemsPrices -= product.price;
    notifyListeners();
  }

  // calculatePrice(int index) {
  //   itemsPrices = itemsPrices + selectedItems[index].price;
  //   notifyListeners();
  // }
}
