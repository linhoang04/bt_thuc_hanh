//Bài 3: Sử dụng thư viện http để truy cập một API RESTful và in ra màn hình dữ liệu đầu ra.
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://api.example.com/data'); // Thay thế URL bằng URL thực tế của API

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body); // In ra dữ liệu đầu ra
    } else {
      print('Lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi: $e');
  }
}