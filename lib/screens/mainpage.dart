import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/screens/cart.dart';
import 'package:vit_bazzar_app/screens/favorites.dart';
import 'package:vit_bazzar_app/screens/home.dart';
import 'package:vit_bazzar_app/screens/myorder.dart';
import 'package:vit_bazzar_app/screens/profile.dart';

class MainPage extends StatefulWidget {
  int? tapIndex;
  MainPage({super.key, this.tapIndex});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    Home(),
    MyOrder(),
    Favorite(),
    Cart(),
    Profile(),
  ];
  int currentIndex = 0;
  void _onTap(int index) {
    setState(() {
      currentIndex = index;
      widget.tapIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(23, 120, 242, 100),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
                
            centerTitle: true,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search in vit.bazzar.in',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.keyboard_voice_outlined),// mic_none_rounded
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      )),
                      filled: true,
                      fillColor: Colors.white
                    ),
                ),
              ),
            ),
            foregroundColor: Colors.transparent,
            backgroundColor: const Color.fromRGBO(23, 120, 242, 100),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            ),
            
          ),
          body: widget.tapIndex == null
              ? pages[currentIndex]
              : pages[widget.tapIndex!],
          bottomNavigationBar: widget.tapIndex == 5
              ? null
              : BottomNavigationBar(
                
                onTap: _onTap,
                currentIndex:
                    widget.tapIndex == null ? currentIndex : widget.tapIndex!,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                showUnselectedLabels: true,    
                items: const [
                  BottomNavigationBarItem(
                    label:"Home",icon:Icon(Icons.home_outlined),backgroundColor: Color.fromRGBO(23, 120, 242, 100),),
                  BottomNavigationBarItem(
                    label:"My Order",icon:Icon(Icons.mode_of_travel_rounded),backgroundColor: Color.fromRGBO(23, 120, 242, 100),),
                  BottomNavigationBarItem(
                    label:"Favorite",icon:Icon(Icons.favorite_border_outlined),backgroundColor: Color.fromRGBO(23, 120, 242, 100),),
                  BottomNavigationBarItem(
                    label:"Cart",icon:Icon(Icons.local_mall_outlined),backgroundColor: Color.fromRGBO(23, 120, 242, 100),),//local_grocery_store_outlined, shopping_bag_outlined
                  BottomNavigationBarItem(
                    label:"Profile",icon:Icon(Icons.person_outline_rounded),backgroundColor: Color.fromRGBO(23, 120, 242, 100),), // account_circle_outlined
                ],
                
                
                ),
              
        ),
      ),
    );
  }
}
