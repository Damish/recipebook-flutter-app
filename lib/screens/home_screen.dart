import 'package:flutterproject3/models/product.dart';
import 'package:flutterproject3/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject3/screens/edit_product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final images = [
    "assets2/breakfast.jpg",
    "assets2/lunch.jpg",
    "assets2/dinner.jpg",
    "assets2/shorteats.jpg",
    "assets2/beverages.jpg",
    "assets2/breakfast.jpg",
    "assets2/lunch.jpg",
    "assets2/dinner.jpg",
    "assets2/shorteats.jpg",
    "assets2/beverages.jpg",
    "assets2/breakfast.jpg",
    "assets2/lunch.jpg",
    "assets2/dinner.jpg",
    "assets2/shorteats.jpg",
    "assets2/beverages.jpg",
  ];

  final foodNames = [
    "Breakfast",
    "Snacks",
    "Lunch",
    "Tea Time",
    "Dinner",
  ];

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: "Add item"),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: "Subscription"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            print("selected index" + this.selectedIndex.toString());
            if (selectedIndex == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProduct('')));
            }
          },
          type: BottomNavigationBarType.fixed,
        ),
        body: (products != null)
            ? SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Looking for your favorite meal",
                                  style:
                                      GoogleFonts.playfairDisplay(fontSize: 30),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.search, size: 29.0),
                                    color: Colors.grey[800],
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.admin_panel_settings,
                                        size: 34.0),
                                    color: Colors.green,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProduct('')));
                                    },
                                  ),
                                  Text(' Admin\nconsole'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          height: size.height * 0.14,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            height: 40.0,
                                            width: 130.0,
                                            child: ClipRRect(
                                              child: Image.asset(
                                                images[index],
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35.0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${foodNames[index]}",
                                                  style: GoogleFonts
                                                      .playfairDisplay(
                                                          color:
                                                              Colors.grey[800],
                                                          fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                              },
                              separatorBuilder: (context, _) => SizedBox(
                                    width: 16,
                                  ),
                              itemCount: 4),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Trending Recipes",
                                  style:
                                      GoogleFonts.playfairDisplay(fontSize: 26),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                iconSize: 35,
                                icon: Icon(Icons.new_releases),
                                color: Colors.pink[700],
                                onPressed: () {},
                              )
                            ])),
                        Container(
                          height: 250,
                          child: ListView.separated(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              images[index],
                                              foodNames[index],
                                              products[index])));
                                },
                                child: AspectRatio(
                                    aspectRatio: 0.9 / 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Hero(
                                            child: Container(
                                              height: 250,
                                              width: 250,
                                              child: ClipRRect(
                                                child: Image.asset(
                                                  images[index],
                                                  fit: BoxFit.cover,
                                                ),

                                                // child: Image.network(
                                                //   images[index],
                                                //   fit: BoxFit.cover,
                                                // ),

                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            tag: images[index],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            products[index].recepieName,
                                            style: GoogleFonts.roboto(
                                                color: Colors.pink[800],
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            'By ' + products[index].author,
                                            style: GoogleFonts.roboto(
                                                color: Colors.grey[600],
                                                fontSize: 11),
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
                            separatorBuilder: (context, _) => SizedBox(
                              width: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Sri Lankan Recipes",
                                  style:
                                      GoogleFonts.playfairDisplay(fontSize: 26),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                iconSize: 35,
                                icon: Icon(Icons.new_releases),
                                color: Colors.blue[600],
                                onPressed: () {},
                              )
                            ])),
                        Container(
                          height: size.height * 0.4,
                          child: ListView.separated(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              images[index],
                                              foodNames[index],
                                              products[index])));
                                },
                                child: AspectRatio(
                                    aspectRatio: 0.9 / 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Hero(
                                            child: Container(
                                              height: 330,
                                              width: 330,
                                              child: ClipRRect(
                                                child: Image.asset(
                                                  images[index],
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            tag: images[index],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            products[index].recepieName,
                                            style: GoogleFonts.roboto(
                                                color: Colors.grey[800],
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            'By ' + products[index].author,
                                            style: GoogleFonts.roboto(
                                                color: Colors.grey[600],
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                            separatorBuilder: (context, _) => SizedBox(
                              width: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            // : Center(child: CircularProgressIndicator()));
            : Center(
                child: LoadingBouncingGrid.square(
                backgroundColor: Colors.blue,
              )));
  }
}
