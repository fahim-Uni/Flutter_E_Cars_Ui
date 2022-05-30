import 'dart:ui';
import 'package:flutter/material.dart';
import 'cars_screen.dart';
import 'const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: black,
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                header(size),
                SizedBox(
                  height: size.height / 30,
                ),
                customSwitch(size),
                SizedBox(
                  height: size.height / 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width / 1.1,
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      color: blueGrey2,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                categories(size),
                SizedBox(
                  height: size.height / 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width / 1.1,
                  child: const Text(
                    "Newly Launched",
                    style: TextStyle(
                      color: blueGrey2,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                listViewBuilder(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilder(Size size) {
    return Expanded(
        child: SizedBox(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return listViewItems(size);
          }),
    ));
  }

  Widget listViewItems(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const CarsScreen(),
          ),
        );
      },
      child: SizedBox(
        width: size.width,
        height: size.height / 5,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 10,
              height: size.height / 5.5,
              width: size.width / 1.1,
              child: Container(
                // height: size.height / 4,
                // width: size.width / 1.1,
                decoration: BoxDecoration(
                  color: blueGrey1,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.bottomRight,
                child: Container(
                  height: size.height / 24,
                  width: size.width / 3.8,
                  decoration: const BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Check It Now",
                    style: TextStyle(
                      color: black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              height: size.height / 6,
              width: size.width / 4,
              child: const Text(
                "Audi Electric Next Gen",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              height: size.height / 4,
              width: size.width / 1.8,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/car1.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categories(Size size) {
    return SizedBox(
      height: size.height / 28,
      width: size.width / 1.1,
      child: Row(
        children: [
          customSwitchItem(size, green, "Electric"),
          customSwitchItem(size, black, "Hybrid"),
          customSwitchItem(size, black, "CNG"),
          //customSwitchItem(size, black, "Hybrid"),
        ],
      ),
    );
  }

  Widget customSwitch(Size size) {
    return SizedBox(
      height: size.height / 22,
      width: size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customSwitchItem(size, green, "Buy New Car"),
          customSwitchItem(size, black, "Customize Car"),
        ],
      ),
    );
  }

  Widget customSwitchItem(Size size, Color color, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: color == green ? black : blueGrey2,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget header(Size size) {
    return SizedBox(
      height: size.height / 10,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.menu,
            color: green,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "E",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: green,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Cars",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "\n'Future of Cars'",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 15,
            width: size.height / 15,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/man.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
