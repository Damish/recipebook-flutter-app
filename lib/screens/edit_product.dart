import 'package:flutterproject3/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject3/screens/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class EditProduct extends StatefulWidget {
  final Product product;
  final String imageURL;
  EditProduct(this.imageURL, [this.product]);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final imageController = TextEditingController();
  final recepieNameController = TextEditingController();
  final authorController = TextEditingController();
  final ingredientsController = TextEditingController();
  final aboutRecepieController = TextEditingController();
  final cookingMethodController = TextEditingController();
  final recepieIdController = TextEditingController();

  @override
  void dispose() {
    recepieIdController.dispose();
    imageController.dispose();
    recepieNameController.dispose();
    authorController.dispose();
    ingredientsController.dispose();
    aboutRecepieController.dispose();
    cookingMethodController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.product == null) {
      recepieIdController.text = "";
      imageController.text = "";
      recepieNameController.text = "";
      authorController.text = "";
      ingredientsController.text = "";
      aboutRecepieController.text = "";
      cookingMethodController.text = "";
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        Product product;
        productProvider.loadValues(product);
      });
    } else {
      recepieIdController.text = widget.product.recepieId;
      imageController.text = widget.product.image;
      recepieNameController.text = widget.product.recepieName;
      authorController.text = widget.product.author;
      ingredientsController.text = widget.product.ingredients;
      aboutRecepieController.text = widget.product.aboutRecepie;
      cookingMethodController.text = widget.product.cookingMethod;
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.product);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: (widget.product == null)
              ? Text('Add Product')
              : Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                controller: recepieNameController,
                onChanged: (value) => productProvider.changeRecepieName(value),
                // initialValue: recipe == null ? '' : recipe.title,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 5) {
                //     return 'Title is required and should be 5+ characters long.';
                //   }
                // },
                onSaved: (String value) {
                  // _formData['foodName'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'Food Name',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.title_outlined,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: imageController,
                onChanged: (value) => productProvider.changeImage(value),
                // initialValue: recipe == null ? '' : recipe.description,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 4) {
                //     return 'Author is required and should be 4+ characters long.';
                //   }
                // },

                onSaved: (String value) {
                  // _formData['author'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'Image url',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.link,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: authorController,
                onChanged: (value) => productProvider.changeAuthor(value),
                // initialValue: recipe == null ? '' : recipe.description,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 4) {
                //     return 'Author is required and should be 4+ characters long.';
                //   }
                // },

                onSaved: (String value) {
                  // _formData['author'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'Author',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                maxLines: 3,
                controller: ingredientsController,
                onChanged: (value) => productProvider.changeIngredients(value),
                // maxLines: 5,
                keyboardType: TextInputType.multiline,
                // initialValue: recipe == null ? '' : recipe.description,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 4) {
                //     return 'Ingredients is required and should be 4+ characters long.';
                //   }
                // },
                onSaved: (String value) {
                  // _formData['ingredients'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'Ingredients',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.food_bank_outlined,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                maxLines: 4,
                controller: aboutRecepieController,
                onChanged: (value) => productProvider.changeAboutRecepie(value),
                // maxLines: 5,
                // initialValue: recipe == null ? '' : recipe.description,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 4) {
                //     return 'AboutRecipe is required and should be 4+ characters long.';
                //   }
                // },
                onSaved: (String value) {
                  // _formData['aboutRecipe'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'About Recipe',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.receipt_long_outlined,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                maxLines: 5,
                controller: cookingMethodController,
                onChanged: (value) =>
                    productProvider.changeCookingMethod(value),
                // maxLines: 5,
                // initialValue: recipe == null ? '' : recipe.description,
                // validator: (String value) {
                //   // if (value.trim().length <= 0) {
                //   if (value.isEmpty || value.length < 4) {
                //     return 'Cooking Method is required and should be 4+ characters long.';
                //   }
                // },
                onSaved: (String value) {
                  // _formData['cookingMethod'] = value;
                },
                decoration: InputDecoration(
                  hintText: 'Cooking Method',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.7),
                      borderSide:
                          new BorderSide(width: 0.0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 15),
                    child: Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Save'),
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Save'),
                          content: const Text('Save changes?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                productProvider.saveProduct();

                                Fluttertoast.showToast(
                                    msg: "Changes saved!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 12.0);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },
                              child: const Text('Save'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                          ],
                        ))),
            (widget.product != null)
                ? RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Delete'),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete Item!'),
                        content: const Text('Are you sure Delete item?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              productProvider
                                  .removeProduct(widget.product.recepieId);

                              Fluttertoast.showToast(
                                  msg: "Deleted Sucessfully!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            },
                            child: const Text('Delete'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
