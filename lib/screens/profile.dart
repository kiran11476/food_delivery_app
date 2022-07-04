import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartech/screens/drawer.dart';
import 'package:zartech/screens/loginpage.dart';
import 'package:zartech/screens/sub_pages.dart/cart_contoller.dart';
import 'package:zartech/screens/sub_pages.dart/screen2.dart';

import 'sub_pages.dart/screen1.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const Drawerss(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
            FromThe(),
            Center(
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          width: 300,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const LoginScreen());
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: const Text('Google'),
          ),
        ),
      )),
    );
  }
}
