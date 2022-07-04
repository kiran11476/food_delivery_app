import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartech/screens/loginpage.dart';
import 'package:zartech/screens/profile.dart';

class Drawerss extends StatelessWidget {
  const Drawerss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color.fromARGB(255, 63, 151, 12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://us.123rf.com/450wm/antonioguillem/antonioguillem1802/antonioguillem180200217/97101619-backlight-silhouette-of-a-mother-raising-her-kid-son-at-sunset-with-the-sun-in-the-middle.jpg?ver=6'),
                  backgroundColor: Colors.transparent,
                ),
                Text('Muhammed Naseem'),
                Text('ID : 410')
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(' Log Out'),
            onTap: () {
              _signOut();
              Get.offAll(const LogIn());
            },
          ),
        ],
      ),
    );
  }
}

_signOut() async {
  await auth.signOut();
}
