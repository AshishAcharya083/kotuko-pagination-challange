import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kotuko_coding_challange/core/models/list_info_model.dart';

class AirlineApi {
  List<ListInfoModel> modelList = [];

  Future<Map<String, dynamic>> getPassengerWithSize(
      {int? page, int? size}) async {
    print("getPassenger CALLED");

    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.instantwebtools.net/v1/passenger?page=$page&size=$size"));
      // print("The json decode is ${response.body}");
      final decodeData = jsonDecode(response.body);
      return decodeData;
      // print(decodeData['data']);
      // return decodeData['data'];
    } catch (e) {
      print("ERROR occured");
      print(e);
      return {"error": e};
    }
  }

  /// getModelList fetches the new data from API if we reach to the end of the list
  Future<List<ListInfoModel>> getModelList(int offset, int limit) async {
    final temp = await getPassengerWithSize(page: offset, size: limit);

    for (int i = 0; i < limit; i++) {
      modelList.add(ListInfoModel.fromMap(temp["data"][i]));
      print(temp["data"][i]["name"]);
    }
    return modelList;
  }

  static Future<Map<String, dynamic>> createPassenger(
      String name, String trips, String airlineCode) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://api.instantwebtools.net/v1/passenger"),
        body: {"name": name, "trips": trips, "airline": airlineCode},
      );
      print("Passenger added SUCCESSFULLY");
      return jsonDecode(response.body);
    } catch (e) {
      print("Create passenger error $e");
      return {'error': e};
    }
  }
}
