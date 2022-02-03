import 'dart:convert';

import 'package:http/http.dart' as http;

class AirlineApi {
  String trigger =
      "https://api.instantwebtools.net/v1/passenger?page=0&size=10";

  Future<Map<String, dynamic>> getPassengerWithSize(
      {int? page, int? size}) async {
    print("getPassenger CALLED");

    try {
      http.Response response = await http.get(Uri.parse(trigger));
      print("The json decode is ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      print("ERROR occured");
      print(e);
      return {"error": e};
    }
  }
}
