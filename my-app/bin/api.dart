import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  const url = "https://jsonplaceholder.typicode.com/albums";
  Future<dynamic> albumsList = getAlbums(url);
  albumsList
      .then((albums) {
        for (var album in albums){
          print("${album["userId"]}\n${album["id"]}\n${album["title"]}");
        }
      })
      .catchError((e){ print("error fetching albums-> $e");});
}

Future<dynamic> getAlbums(String url) async {
  http.Response res = await http.get(Uri.parse(url), headers:{"User-Agent":"Dart/Flutter", "Accept":"application/json"}); //http requests return Future<http.Response> handled by async-await or .then().catchError()
  print(res.statusCode); //before add headers it print 403(forbidden) because the server treated the client as suspicious.
  if (res.statusCode == 200) {
    return json.decode(res.body);
  } else {
    throw Exception("Error fetching Albums!"); //when wrapping this block with try-catch and an Exception throwed in main ot will received as Null if we don't rethrow the exception in catch (causing another unhandled Exception).
  }
}
