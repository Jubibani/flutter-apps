import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp();
  
    Widget build(BuildContext context) {
    return MaterialApp(
      title: "Making a class",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Making a class"),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
//creating a class
class Container extends StatelessWidget{ // this will be my super class
  final double width;
  final double height;
  final double color;
  
  const Container({ //constructor
    width= 50, 
    height= 50, 
    color= Colors.red
    })

}
