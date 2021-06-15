class Product {
  String recepieId;
  String image;
  String recepieName;
  String author;
  String ingredients;
  String aboutRecepie;
  String cookingMethod;

  Product(
      {this.recepieId,
      this.image,
      this.recepieName,
      this.author,
      this.ingredients,
      this.aboutRecepie,
      this.cookingMethod});

  Map<String, dynamic> toMap() {
    return {
      'recepieId': recepieId,
      'image': image,
      'recepieName': recepieName,
      'author': author,
      'ingredients': ingredients,
      'aboutRecepie': aboutRecepie,
      'cookingMethod': cookingMethod
    };
  }

  Product.fromFireStore(Map<String, dynamic> firestore)
      : recepieId = firestore['recepieId'],
        image = firestore['image'],
        recepieName = firestore['recepieName'],
        author = firestore['author'],
        ingredients = firestore['ingredients'],
        aboutRecepie = firestore['aboutRecepie'],
        cookingMethod = firestore['cookingMethod'];
}
