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

  Future<List<ListInfoModel>> getModelList(int offset, int limit) async {
    print("get model list called");

    final temp = await getPassengerWithSize(page: offset, size: limit);

    print("temp data legth is ${temp["data"].length}");

    for (int i = 0; i < limit; i++) {
      print("inside for loop");

      modelList.add(ListInfoModel.fromMap(temp["data"][i]));
      print(temp["data"][i]["name"]);
    }

    print(modelList);

    return modelList;
  }
}
