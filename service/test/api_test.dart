import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:postman_dio/postman_dio.dart';
import 'package:service/infrastructure/api.dart';

void main() {
  final options = BaseOptions(
      sendTimeout: 10000, connectTimeout: 10000, receiveTimeout: 10000);
  final dio = Dio(options);
  final api = CatalogueApi(dio);

  setUp(() {
    dio.interceptors.add(PostmanDioLogger(enablePrint: true));
  });

  test('getCatalogues', () async {
    // expect(await testService(), true);
    // final res = await api.getCatalogues();
    // final account = res.responseData;
    // final userId = account!.userId;
    // await accountClient.getAccessToken('data');
    // await accountClient.getReward(userId!);
    // final res = await accountClient.getReward('userId!');
    // expect(await testAuth(), true);
    await api.getCatalogues();
  });
}


// Future<bool> testService() async {
//   // final res = await client.getCountries();
//   // final res = await client.getMealPlans();
//   // final res = await client.getLanguages();
//   // final res = await client.getCurrencies();
//   // final res = await client.getPhoneCodes();
//   // final res = await client.getFlightParts();
//   // final res = await client.getAirLineMemberClubs();
//   // final res = await client.getLocations('Thai');
//   // final res = await client.getCities();
//   // final res = await client.getDistricts();
//   // final res = await client.getAirportsByKW('Thai');
//   // final res = await client.getFlightAirports('Thai');
//   // final res = await client.getResources(1, ['COMMON']);
//   // final res = await client.getResourceValue(1, 'CUISINE_AMERICAN');
//   // final res = await client.getResourceValue(1, '\'CUISINE_AMERICAN\'');
//   // final res =
//   // await client.getResourceValue(1, jsonEncode('CUISINE_AMERICAN'));
//   // final res = await client.getExchangeRate('thb', 'usd');

//   // return res.valid;
// }
