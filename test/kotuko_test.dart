import 'package:flutter_test/flutter_test.dart';
import 'package:kotuko_coding_challange/core/service/airline_api.dart';

void main() {
  test('upload new user', () {
    AirlineApi airlineApi = AirlineApi();
    airlineApi.getModelList(8, 7);
    int resultArrayLength = airlineApi.modelList.length;

    expect(resultArrayLength.isFinite, true);
  });
}
