import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartech/screens/sub_pages.dart/cart_contoller.dart';

import 'sub_pages.dart/screen1.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.to(CartContoller());
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.align_horizontal_left,
            color: Colors.black,
          ),
          bottom: const TabBar(
            unselectedLabelColor: Colors.black,
            indicatorWeight: 3,
            indicatorColor: Colors.red,
            isScrollable: true,
            unselectedLabelStyle: TextStyle(color: Colors.red),
            labelColor: Colors.red,
            tabs: [
              Tab(
                text: 'Salads and Soup',
              ),
              Tab(
                text: ' From The Bernayard',
              ),
              Tab(
                text: 'From the Bernayard',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SoupSalad(),
            Center(
              child: Text('data'),
            ),
            Center(
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
