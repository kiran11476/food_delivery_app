import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:zartech/services/remoteclients.dart';

class SoupSalad extends StatelessWidget {
  const SoupSalad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = FlutterCart();

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
                        height: 250,
                        // width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.red,
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
                                        wordSpacing: 2,
                                        letterSpacing: 1),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${snapshot.data![index]["dish_price"]}Rs',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        '${snapshot.data![index]["dish_calories"]}Calories',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data![index]["dish_description"]
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1),
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
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove)),
                                        const Text("data"),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: Image.network(
                                    snapshot.data![index]['dish_image']),
                                color: Colors.red,
                                width: 70,
                                height: 70,
                              ),
                            )
                          ],
                        ),
                      );
                      // title:
                      //     Text(snapshot.data![index]["dish_name"].toString()),
                      // leading: Image.network(
                      //   snapshot.data![index]['dish_image'].toString(),
                      //   width: 50,
                      // ),
                      // subtitle: Text(snapshot.data![index]['dish_description']
                      //     .toString()),
                    });
              }
              return CircularProgressIndicator();
            }));
  }
}

// ListView.builder(
//   scrollDirection: Axis.vertical,
//   shrinkWrap: true,
//   itemCount: productController.productList.length,
//   itemBuilder: (context, index) {
//     return SizedBox(
//       height: 250,
//       width: double.infinity,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 20,
//               width: 20,
//               color: const Color.fromARGB(255, 171, 80, 80),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // const Text(),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text("data"),
//                   SizedBox(
//                     width: 180,
//                   ),
//                   Text("dc"),
//                 ],
//               ),
//               kheight,
//               const Text(
//                   'chicken dfnajskndjjfjfbsdj\nbfskjbfsbfbfbsfnsbmfnbfbsbfsbjfbsbjh'),
//               kheight,
//               Container(
//                 height: 60,
//                 width: 60,
//                 color: Colors.green,
//               ),
//               // const Text('data')
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 70,
//               width: 70,
//               color: Colors.green,
//             ),
//           ),
//         ],
//       ),
//     );
//   },
// );
