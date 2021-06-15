import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject3/models/product.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Product product) {
    return (_db
        .collection('products')
        .doc(product.recepieId)
        .set(product.toMap()));
  }

  Stream<List<Product>> getProducts() {
    return (_db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromFireStore(document.data()))
        .toList()));
  }

  Future<void> removeProduct(String recepieId) {
    return _db.collection('products').doc(recepieId).delete();
  }
}
