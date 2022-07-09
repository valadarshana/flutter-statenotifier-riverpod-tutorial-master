import 'dart:convert';
import 'package:http/http.dart' as http;


class DataApi {
  final String url;
  final data;
  final method;

  DataApi({this.url,this.data,this.method});

  Future<List<Object>> fetchData() async {
    final List<Object> fetchData = [];

    // var headers = {
    //   'Content-Type': 'application/json',
    //   'User-Token': '',
    //   'Authorization': 'Basic NDE2MjZkZWFlZWQxN2NkMzI0NDgyMDQ1NjhkYTI0NGU6ZmY5NGUzNWM3MDYwYTM0MWVmMDc2NWU2M2RiMTQxZDY=',
    // //'Cookie': 'aanwebsolution=29bfaeb925420ecc1c91d01176caa11dfb90c185'
    // };
   // print('UserToken: ${global.User_token}');
    print('data api call');

    var request = http.Request(method==null?'POST':'GET', Uri.parse(url));
    request.body = json.encode(data);
    //request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responseBody = await http.Response.fromStream(response);
    fetchData.add(json.decode(responseBody.body));


    //var responseData = jsonDecode(response.body);
    //print("show Response Data:$responseData");
    //fetchData.add(responseData);
    //print('response of else part');
    //print(responseData);
    return fetchData;
  }
}