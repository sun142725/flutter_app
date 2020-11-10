import 'dart:convert';
import 'dart:io';
class MyHttp {
  _getGoodInfo() async{
    var url = 'http://47.93.206.48:666/elephant-admin/mall/drug/info';
    var httpClient = new HttpClient();

    try{
      var request = await httpClient.getUrl(new Uri.http(
          '47.93.206.48:666', '/elephant-admin/mall/drug/info'));
      var response = await request.close();
      if(response.statusCode == HttpStatus.OK){
        var json = await response.transform(utf8.decoder).join();
        var data = new Map.from(jsonDecode(json)['data']);
        print(data);

      } else {
        print('Error getting IP address:\nHttp status ${response.statusCode}');
      }
    }catch(exception){
      print(exception);
    }
  }
}