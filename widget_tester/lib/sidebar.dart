import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3),
            height: 50,
            width: 150,
            child: ElevatedButton(onPressed: () {}, child: Text("Sidebar")),
          ),
          Container(
            margin: EdgeInsets.all(3),
            height: 50,
            width: 150,
            child: ElevatedButton(onPressed: () {}, child: Text("Sidebar")),
          ),
          Container(
            margin: EdgeInsets.all(3),
            height: 50,
            width: 150,
            child: ElevatedButton(onPressed: () {}, child: Text("Sidebar")),
          ),
          Container(
            margin: EdgeInsets.all(3),
            height: 50,
            width: 150,
            child: ElevatedButton(onPressed: () {}, child: Text("Sidebar")),
          ),
        ],
      ),
    );
  }
}
