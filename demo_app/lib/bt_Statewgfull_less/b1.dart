//Bài 1: Hãy tạo một  StatelessWidget  đơn giản để hiển thị một văn bản "Hello, World!". 
import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Center(child: MyWidget()),
      ),
      ),
      debugShowCheckedModeBanner : false,
  ));
}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!');
  }
}