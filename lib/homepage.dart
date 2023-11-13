import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage> {
  List appnews =[];
  getnews() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      appnews.addAll(responsebody);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: appnews.length,
        itemBuilder: (context,i) {
        return Text('${appnews[i]["title"]}');
        } );
  }
}
