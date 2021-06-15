import 'package:flutter/foundation.dart';
import 'package:flutterproject3/models/product.dart';
import 'package:flutterproject3/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _recepieId;
  String _image;
  String _recepieName;
  String _author;
  String _ingredients;
  String _aboutRecepie;
  String _cookingMethod;
  var uuid = Uuid();

  //Getters
  String get recepieId => _recepieId;
  String get image => _image;
  String get recepieName => _recepieName;
  String get author => _author;
  String get ingredients => _ingredients;
  String get aboutRecepie => _aboutRecepie;
  String get cookingMethod => _cookingMethod;

  //Setters
  changeRecepieId(String value) {
    _recepieId = value;
    notifyListeners();
  }

  changeImage(String value) {
    _image = value;
    notifyListeners();
  }

  changeRecepieName(String value) {
    _recepieName = value;
    notifyListeners();
  }

  changeAuthor(String value) {
    _author = value;
    notifyListeners();
  }

  changeIngredients(String value) {
    _ingredients = value;
    notifyListeners();
  }

  changeAboutRecepie(String value) {
    _aboutRecepie = value;
    notifyListeners();
  }

  changeCookingMethod(String value) {
    _cookingMethod = value;
    notifyListeners();
  }

  loadValues(Product product) {
    _recepieId = product.recepieId;
    _image = product.image;
    _recepieName = product.recepieName;
    _author = product.author;
    _ingredients = product.ingredients;
    _aboutRecepie = product.aboutRecepie;
    _cookingMethod = product.cookingMethod;
  }

  saveProduct() {
    print(_recepieId);
    if (_recepieId == null) {
      var newProduct = Product(
          image: image,
          recepieName: recepieName,
          author: author,
          ingredients: ingredients,
          aboutRecepie: aboutRecepie,
          cookingMethod: cookingMethod,
          recepieId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = Product(
          image: _image,
          recepieName: _recepieName,
          author: _author,
          ingredients: _ingredients,
          aboutRecepie: _aboutRecepie,
          cookingMethod: _cookingMethod,
          recepieId: _recepieId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String recepieId) {
    firestoreService.removeProduct(recepieId);
  }
}
