import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartech/controller/product_controller.dart';

import 'package:zartech/services/remoteclients.dart';

class SoupSalad extends StatelessWidget {
  const SoupSalad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    String url =
        'http://foodsafetyhelpline.com/wp-content/uploads/2013/05/non-veg-300x259.jpg';
    // var c = Remoteservices().getPost();
    // final controller = Get.put(ProductController());
    return SafeArea(
        child: FutureBuilder<List<dynamic>?>(
            future: NewApiService().getSaladsAndSoups(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 200,
                        // width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: Image(
                                    height: 17,
                                    width: 17,
                                    image: NetworkImage(url)),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 250,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index]["dish_name"]
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${snapshot.data![index]["dish_price"]}\tRs',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        '${snapshot.data![index]["dish_calories"]}\tCalories',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data![index]["dish_description"]
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 51, 153, 54),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    height: 40,
                                    width: 130,
                                    child: Row(
                                      children: [
                                        Obx(() => IconButton(
                                            onPressed: () {
                                              controller.decrement();
                                            },
                                            icon: const Icon(Icons.remove))),
                                        Obx(() => Text(
                                              controller.count.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )),
                                        Obx(() => IconButton(
                                            onPressed: () {
                                              controller.increment();
                                              FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .add({
                                                'item_name':
                                                    '${snapshot.data![index]["dish_name"]}',
                                                'item_price':
                                                    '${snapshot.data![index]["dish_price"]}',
                                                'item_calories':
                                                    '${snapshot.data![index]["dish_calories"]}',
                                              });
                                            },
                                            icon: const Icon(Icons.add))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                child: Image.network(
                                    'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000'),
                                width: 80,
                                height: 80,
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
              return Container();
            }));
  }
}
