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
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
           viewportFraction: 1,
           
            autoPlay: true,
          ),
          items: _banner.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                    ));
              },
            );
          }).toList(),
        ));
  }
}
