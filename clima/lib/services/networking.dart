import 'package:http/http.dart';
import 'dart:convert';

class Network {
  Network(this.url);
  final String url;

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body); // Notice, Dynamic Return
      return data;
    } else {
      return null;
    }
  }
}
