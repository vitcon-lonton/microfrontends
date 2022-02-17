/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'package:service/infrastructure/models.dart';

part 'api.g.dart';

const getCataloguesUrl = '';
const aboutUrl = 'https://www.aqbooking.com/about-us.html';
const privacyUrl = 'https://www.aqbooking.com/privacy.html';
const cache = CacheControl(maxAge: 172800, maxStale: 172800);

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/catalogues')
abstract class CatalogueApi {
  factory CatalogueApi(Dio dio, {String baseUrl}) = _CatalogueApi;

  @GET(aboutUrl)
  Future<String> getAbout();

  @GET(privacyUrl)
  Future<String> getPolicy();

  @GET('')
  Future<BaseResponse<List<CatalogueDto>>> getCatalogues();
}








































// const getCountriesUrl = '/Countries';
// const getCurrenciesUrl = '/Currencies';
// const getLocationUrl = '/location/search';
// const getCitiesUrl = '/Cities/CountryCode';
// const getResourcesUrl = '/CommonResources';
// const getDistrictsUrl = '/ZoneDistricts/CityCode';
// const getPhoneCodesUrl = '/GetAllCountryPhoneCode';
// const getMealPlansUrl = '/Airline/FlightMealPlanCodes';
// const getAirportsUrl = '/Airport/SearchAirportByKeyword';
// const getFlightPartsUrl = '/Airport/FlightPartGetAllCountries';
// const getCurrencyRateUrl = '/Currencies/GetCurrencyExchangeRate';
// const getAirlineMembersUrl = '/Airline/FlightAirlineMemberClubs';
// const getFlightAirportsUrl = '/Airport/SearchFlightDestinationByKeyword';
// @GET(getMealPlansUrl)
// Future<BaseResponse<List<MealPlan>>> getMealPlans();

// @GET(getCurrenciesUrl)
// Future<BaseResponse<List<Currency>>> getCurrencies();

// @GET(getPhoneCodesUrl)
// Future<BaseResponse<List<PhoneCode>>> getPhoneCodes();

// @GET(getFlightPartsUrl)
// Future<BaseResponse<List<FlightPart>>> getFlightParts();

// @GET(getAirlineMembersUrl)
// Future<BaseResponse<List<AirlineMember>>> getAirLineMemberClubs();

// @GET(getLocationUrl)
// Future<BaseResponse<List<Location>>> getLocations(
//     @Query('keyword') String keyword);

// @GET('$getCitiesUrl/{countryCode}')
// Future<BaseResponse<List<City>>> getCities(@Path() int countryCode);

// @GET('$getDistrictsUrl/{cityCode}')
// Future<BaseResponse<List<District>>> getDistricts(@Path() int cityCode);

// @GET('$getAirportsUrl/{keyword}')
// Future<BaseResponse<List<Airport>>> getAirportsByKW(@Path() String keyword);

// @GET('$getFlightAirportsUrl/{keyword}')
// Future<BaseResponse<List<FlightAirport>>> getFlightAirports(
//     @Path() String keyword);

// @GET('$getCurrencyRateUrl/{base}/{exchange}')
// Future<BaseResponse<List<Rate>>> getExchangeRate(
//     @Path() String base, @Path() String exchange);

// @POST('$getResourcesUrl/{language}')
// Future<BaseResponse<List<ResourceDto>>> getResources(
//     @Path() int language, @Body() List<String> types);

// @cache
// @FormUrlEncoded()
// @Headers({'Content-Type': 'application/json'})
// @POST('$getResourcesUrl/ResourceValue/{language}')
// Future<BaseResponse<String>> getResourceValue(
//     @Path() int language, @Body() String resourceKey);