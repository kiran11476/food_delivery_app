import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zartech/core/constants.dart';
import 'package:zartech/screens/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String passsword,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: passsword);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        Text("No User found that Email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 83, 78, 78),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Log In',
              style: TextStyle(
                  fontSize: 44,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            kheight,
            TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            kheight,
            TextField(
              obscureText: true,
              controller: _passwordcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            kheight,
            const Text(
              "Don't Remember Your password?",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: RawMaterialButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(
                      email: _emailcontroller.text,
                      passsword: _passwordcontroller.text,
                      context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
