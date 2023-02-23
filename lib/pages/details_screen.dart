import 'package:ecommerce_app/model/item.dart';
import 'package:ecommerce_app/shared/appbar.dart';
import 'package:ecommerce_app/shared/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Item product;

  Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // const Details({Key? key}) : super(key: key);
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text('Details screen'),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath),
            const SizedBox(
              height: 12,
            ),
            Text(
              '\$ ${widget.product.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 129, 129),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Text(
                              'New',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 191, 0),
                                size: 35,
                              ),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 191, 0),
                                size: 35,
                              ),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 191, 0),
                                size: 35,
                              ),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 191, 0),
                                size: 35,
                              ),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 191, 0),
                                size: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.edit_location,
                            size: 35,
                            color: Color.fromARGB(168, 3, 65, 27),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.product.location,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Details : ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.product.details,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: isShowMore ? 3 : null,
                    overflow: TextOverflow.fade,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isShowMore = !isShowMore;
                      });
                    },
                    child: Text(
                      isShowMore ? 'Show more' : 'Show Less',
                      style: const TextStyle(
                        fontSize: 18,
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
