import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/style.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';
import 'package:cocktail_flutter/Constants/widgets.dart';

class cocktailPage extends StatefulWidget {
  const cocktailPage({Key? key}) : super(key: key);

  @override
  State<cocktailPage> createState() => _cocktailPageState();
}

class _cocktailPageState extends State<cocktailPage> {
  List<String> cocktailPicPathList = [
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
    "Images/Margarita.jpg",
  ];
  List<String> cocktailNameList = [
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail  Name",
    "Cocktail Name",
    "Cocktail Name",
    "Cocktail Name",
  ];

  List<String> cocktailCategoryList = [
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    " Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    "Cocktail Category",
    " Cocktail Category",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: kSearch,
                prefixIcon: Icon(Icons.search),
                focusedBorder: kOutlineInputBorder,
                errorBorder: kOutlineInputBorder,
                disabledBorder: kOutlineInputBorder,
                border: kOutlineInputBorder,
              ),
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset("Images/Margarita.jpg"),
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cocktailNameList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.yellow.shade200,
                      ),

                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 13, vertical: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Image.asset("${cocktailPicPathList[index]}"),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomLeft: Radius.circular(50.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 17),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      cocktailNameList[index],
                                      style: TextStyle(fontSize: 19.0),
                                    ),
                                    Spacer(),
                                    Text(
                                      cocktailCategoryList[index],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
