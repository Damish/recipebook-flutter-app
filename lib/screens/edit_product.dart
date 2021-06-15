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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: imageController,
              decoration: InputDecoration(hintText: 'Product image'),
              onChanged: (value) => productProvider.changeImage(value),
            ),
            TextField(
              controller: recepieNameController,
              decoration: InputDecoration(hintText: 'Product recepieName'),
              onChanged: (value) => productProvider.changeRecepieName(value),
            ),
            TextField(
              controller: authorController,
              decoration: InputDecoration(hintText: 'Product author'),
              onChanged: (value) => productProvider.changeAuthor(value),
            ),
            TextField(
              controller: ingredientsController,
              decoration: InputDecoration(hintText: 'Product ingredients'),
              onChanged: (value) => productProvider.changeIngredients(value),
            ),
            TextField(
              controller: aboutRecepieController,
              decoration: InputDecoration(hintText: 'Product aboutRecepie'),
              onChanged: (value) => productProvider.changeAboutRecepie(value),
            ),
            TextField(
              controller: cookingMethodController,
              decoration: InputDecoration(hintText: 'Product cookingMethod'),
              onChanged: (value) => productProvider.changeCookingMethod(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
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
                ),
              ),
            ),
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
