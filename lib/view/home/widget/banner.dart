import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> _banner = [
    "assets/images/banner01.png",
    "assets/images/banner02.png",
    "assets/images/banner03.png",
    "assets/images/banner04.png",
    "assets/images/banner05.png",
    "assets/images/banner06.png",
  ];
  int currentndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        banner(context),
        incator(),
      ],
    );
  }

  incator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _banner.map((e) {
          final index = _banner.lastIndexOf(e);
          print("index==>$index");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 8,
              width: currentndex == index ? 20 : 10,
              decoration: BoxDecoration(
                  color:
                      currentndex == index ? Colors.red : Colors.grey.shade400,
                  borderRadius: currentndex == index
                      ? BorderRadius.circular(5)
                      : BorderRadius.circular(20)),
            ),
          );
        }).toList());
  }

  Container banner(BuildContext context) {
    return Container(
        height: 140,
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentndex = index;
                print(currentndex);
              });
            },
          ),
          items: _banner.map((i) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                ));
          }).toList(),
        ));
  }
}
