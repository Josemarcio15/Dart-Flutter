import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.orange,
          height: 100,
          child: Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("data")),
              ElevatedButton(onPressed: () {}, child: Text("data")),
              ElevatedButton(onPressed: () {}, child: Text("data")),
              ElevatedButton(onPressed: () {}, child: Text("data")),
              ElevatedButton(onPressed: () {}, child: Text("data")),
            ],
          ),
        ),
        Container(
          color: Colors.deepOrange,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                width: 400,
                height: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("botao grande"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
