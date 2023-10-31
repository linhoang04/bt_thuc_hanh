//Bài 2: Hãy tạo một  StatefulWidget  có một nút "Click Me". Mỗi khi nút được nhấn,
// hãy thay đổi nội dung của văn bản hiển thị giữa "Button clicked" và "Button not clicked". 
import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Center(child: MyWidget(false)),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {

  late bool loangding;

  MyWidget(this.loangding);

  @override
  State<StatefulWidget> createState() {
    return MyWidget2();
  }
}

class MyWidget2 extends State<MyWidget>{
  // late bool _localLoading;
  // @override
  // void initState() {
  //   _localLoading = widget.loangding;
  // }

  @override
  Widget build(BuildContext context) {
    return widget.loangding ? const CircularProgressIndicator(): FloatingActionButton(onPressed: onClick);
  }
  void onClick(){
    setState(() {
      widget.loangding = true;
    });
  }
}