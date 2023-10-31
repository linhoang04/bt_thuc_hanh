//Bài 3: Hãy tạo một  StatefulWidget  có một trường văn bản và một nút "Clear".
// Khi nút được nhấn, hãy xóa nội dung của trường văn bản. 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clear Text Field Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();

  void _clearTextField() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clear Text Field Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text...',
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: _clearTextField,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
  
  RaisedButton({required void Function() onPressed, required Text child}) {}
}
