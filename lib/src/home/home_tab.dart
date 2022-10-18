import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/folder/custom_colors.dart';
import 'package:quitanda/src/home/components/CategoryTile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = ["Frutas","Legumes","Lacticineos","Verduras", "Carnes","Cereais"];

  String selectedCategory = "Frutas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
          TextSpan(
              text: "Green",
              style: TextStyle(color: CustomColors.customSwatchCOlor)),
          TextSpan(
              text: "grocer",
              style: TextStyle(color: CustomColors.customContrastColor)),
        ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              child: Badge(
                  badgeColor: CustomColors.customContrastColor,
                  badgeContent: Text("1",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchCOlor,
                  )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14
                  ),
                  prefixIcon: Icon(Icons.search, color: CustomColors.customContrastColor, size: 21,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none
                      )
                  )),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 25) ,
            height: 40,
            child: ListView
                .separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_,index){
                return CategoryTile(
                  onPressed: (){
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                category: categories[index],
                isSelected: categories[index] == selectedCategory
              );},
              separatorBuilder: (_,index){
                return SizedBox(width: 10);
              },
            ),
          )
        ],
      ),
    );
  }
}
