import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore _firebaseFirestore;
  initiliase() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot; 
    List docs = [];
    try{
      querySnapshot = await _firebaseFirestore.collection('Product').get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs.toList()) {
        Map a = {"id": doc.id,"name": doc.get('Product_Name'), "url": doc.get("Product_Imge")};
        docs.add(a);
      }
      return docs; 
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }
}