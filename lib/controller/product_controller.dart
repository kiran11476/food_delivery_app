import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }

  void deleteNote(events, index) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(events[index].doc.reference);
    });
  }
}
