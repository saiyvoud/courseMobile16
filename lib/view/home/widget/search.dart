import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search..",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.category,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
