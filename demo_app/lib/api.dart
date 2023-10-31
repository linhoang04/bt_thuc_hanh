import 'dart:convert';
import 'package:demo_app/bt_Statewgfull_less/b3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'order.dart';

void main(){
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: JsonInfoWidget(),
      ),
    ),
  ));
}

const jsonString = 
{
  "orderId": 12345,
  "user": {
    "fullName": "Ryan Nguyen",
    "email": "linhoang@gmail.com",
  },
  "products": [
    {
      "id": 1,
      "name": "Product A",
      "price": 10.99,
      
    },
    {
      "id": 2,
      "name": "Product B",
      "price": 19.99,
      
    }
  ]
};

class JsonInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonInfoWidgetState();
  }
}

class JsonInfoWidgetState extends State<JsonInfoWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          Map<String, dynamic> map = jsonDecode(jsonString as String);
          var order = Order.fromJson(map);
          print(order.orderId);
          print(order.user);
          print(order.product);
        },
        child: Text("hello api"),
      ),
    );
  }

}