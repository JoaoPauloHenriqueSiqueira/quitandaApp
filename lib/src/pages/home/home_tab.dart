import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/home/components/CategoryTile.dart';
import 'package:quitanda/src/pages/home/components/ItemTile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // SEARCH FIELD
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Search",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),

          // CATEGORIES
          Container(
            padding: EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: app_data.categories.length,
              itemBuilder: (_, index) {
                return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory);
              },
              separatorBuilder: (_, index) {
                return SizedBox(width: 10);
              },
            ),
          ),

          // GRID
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 9 / 11.5 ),
                itemBuilder: (_,index){
                  return ItemTile(item: app_data.items[index]);
                }, itemCount: app_data.items.length,),
          )
        ],
      ),
    );
  }
}
