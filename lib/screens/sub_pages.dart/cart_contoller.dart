import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartContoller extends StatelessWidget {
  CartContoller({Key? key}) : super(key: key);
  final url =
      'http://foodsafetyhelpline.com/wp-content/uploads/2013/05/non-veg-300x259.jpg';
  final Stream _usersStream =
      FirebaseFirestore.instance.collection('cart').snapshots();
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
        body: StreamBuilder(
            stream: _usersStream,
            builder: (ctx, streamsnapshot) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) => SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(131, 158, 158, 158))),
                      height: 500,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromARGB(255, 30, 71, 31)),
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  height: 17,
                                  width: 17,
                                  image: NetworkImage(url)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(''),
                                  Text('INR \t 20.00'),
                                  Text('112 \t Calories'),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 20, 63, 22),
                                    borderRadius: BorderRadius.circular(13)),
                                height: 40,
                                width: 120,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                    const Text("0"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                              const Text('INR 20.00'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
