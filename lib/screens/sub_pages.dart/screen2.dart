import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartech/controller/product_controller.dart';

import 'package:zartech/services/remoteclients.dart';

class FromThe extends StatelessWidget {
  const FromThe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller addController = Get.put(Controller());
    String url =
        'http://foodsafetyhelpline.com/wp-content/uploads/2013/05/non-veg-300x259.jpg';

    return SafeArea(
        child: FutureBuilder<List<dynamic>?>(
            future: NewApiService().fromTheBer(),
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
                                        IconButton(
                                            onPressed: () {
                                              addController.decrement();
                                            },
                                            icon: const Icon(Icons.remove)),
                                        Obx(() => Text(
                                              addController.count.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              addController.increment();
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
                                            icon: const Icon(Icons.add)),
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
