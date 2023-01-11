import 'package:cartera/controller/bottomnav_provider.dart';
import 'package:cartera/view/bill_splitter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/homescreen.dart';

// ignore: must_be_immutable
class BottomScreens extends StatelessWidget {
  BottomScreens({Key? key}) : super(key: key);

  int currentIndex = 0;
  final screens = [const HomeScreen(), const BillSplitter()];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottumNavigationBarProvider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(index: currentIndex, children: screens),
        bottomNavigationBar: Consumer<BottumNavigationBarProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(),
                Container(
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    selectedFontSize: 15,
                    unselectedItemColor: Colors.red,
                    selectedIconTheme: const IconThemeData(color: Colors.white),
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.shifting,
                    currentIndex: currentIndex,
                    onTap: (index) {
                      currentIndex = index;
                      provider.currentIndex = index;
                    },
                    items: const [
                      BottomNavigationBarItem(
                          label: "home",
                          icon: Icon(
                            Icons.home,
                            color: Colors.red,
                          )),
                      BottomNavigationBarItem(
                          label: "Splitter",
                          icon: Icon(
                            Icons.money,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
