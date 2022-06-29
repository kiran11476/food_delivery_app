import 'package:flutter/material.dart';

class AddingToCart extends StatelessWidget {
  const AddingToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const Card();
      }),
    );
  }
}
