import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zartech/controller/product_controller.dart';

class CartContoller extends StatelessWidget {
  CartContoller({Key? key}) : super(key: key);

  final Controller controller = Controller();
  final Controller addController = Get.put(Controller());
  final url =
      'http://foodsafetyhelpline.com/wp-content/uploads/2013/05/non-veg-300x259.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back(canPop: true);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          title: const Text(
            'Order Summary',
            style: TextStyle(color: Color.fromARGB(205, 158, 158, 158)),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 370,
                color: const Color.fromARGB(255, 19, 46, 20),
                child: const Text(
                  '2 Dishes- 2 item',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, wordSpacing: 3),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('cart').snapshots(),
                  builder: (ctx,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    final document = snapshot.data!.docChanges;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: document.length,
                      itemBuilder: (ctx, index) => Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(131, 158, 158, 158),
                              ),
                            ),
                            height: 100,
                            width: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                        height: 17,
                                        width: 17,
                                        image: NetworkImage(url)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 70,
                                          child: Text(
                                            document[index].doc['item_name'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(document[index].doc['item_price']),
                                        Text(document[index]
                                            .doc['item_calories']),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 20, 63, 22),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      height: 40,
                                      width: 120,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                addController.decrement();
                                                controller.deleteNote(
                                                    snapshot, index);
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              )),
                                          Obx(() => Text(
                                                addController.count.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                addController.increment();
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        '${document[index].doc['item_price']}\tINR'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 10, 25, 10),
              ),
              height: 50,
              width: 370,
              child: const Text(
                'Place Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
