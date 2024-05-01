import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technews/model/user_model.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<User> registerUser(
      String uid, String fullName, String email, String phoneNumber) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    });
    return User(
        id: uid, name: fullName, email: email, phoneNumber: phoneNumber);
  }

  Future<User> getUserByEmail(String email) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    final QuerySnapshot result =
        await userCollection.where('email', isEqualTo: email).get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length == 0) {
      throw Exception('No user found with this email');
    }
    return User(
      id: documents[0].id,
      name: documents[0]['fullName'],
      email: documents[0]['email'],
      phoneNumber: documents[0]['phoneNumber'],
    );
  }
}
