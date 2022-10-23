import 'package:astrology_app/utils/globals.dart';
import 'package:astrology_app/views/detail_screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Image bgImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bgImage = Image.asset("assets/images/wallpapers.jpg");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(bgImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage.image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color(0XFF181727),
              BlendMode.color,
            ),
          ),
        ),
        child: Container(
          height: height,
          width: width,
          color: Color(0XFF181727).withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/zodiac.png",
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 580,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: sunSignList.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(index: i,image: sunSignList[i]["image"], name: sunSignList[i]["name"]),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 90,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.7),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "${sunSignList[i]["image"]}",
                                      height: 35,
                                      width: 35,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${sunSignList[i]["name"]}",
                                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.bold, fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${sunSignList[i]["subtext"]}",
                                            style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
