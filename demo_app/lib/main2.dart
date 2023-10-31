
import 'dart:async';

import 'package:demo_app/bt_Statewgfull_less/b1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: MyWidget(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidget2();
  }

}
class MyWidget2 extends State<MyWidget>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<int>(
              future: delayNumber(),
              builder: (context, snapshot) {
                //builder là những tp mà sẽ nhận kqua trả về từ future và rendẻ ra UI
                //snapshot chính là kq trả về từ future 
                if(snapshot.hasError){
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 40),
                  );
                }
                if(snapshot.hasData){
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 40),
                  );
                }
                return Text(
                  "Wating for resalt", // data là đại diện cho cái delayNumber trả về do trả về kiểu int nên phait .toString
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            ElevatedButton(
              onPressed: () async{
                try {
                  var number = await delayNumberWithError();
                print(number);
                }catch (e){
                  print(e.toString());// data là đại diện cho cái delayNumber trả về do trả về kiểu int nên phait .toString
                }
              },
              child: Text('Future button'),
              ),
          ],
        ),
      ),
    );
  }
}

Future<int> delayNumber(){
  return Future.delayed(Duration(seconds: 3), ()=> 200);
}

Future<void> asyncMethod() {
  return Future.delayed(Duration(seconds: 2), ()=> print("Future method"));
}

Future<int> delayNumberWithError(){
  return Future.delayed(
    Duration(seconds: 2), () => throw Exception("Co loi xay ra"),
  );
}

Future<int> getAge(){ // để không Future tương đường Future<dynamic>
  final c = Completer<int>(); // đã thên int vào Future thì cũng phải thêm vào Complete
  Future.delayed(Duration(seconds: 2), () {
    c.complete(100);
  });
  return c.future;
}