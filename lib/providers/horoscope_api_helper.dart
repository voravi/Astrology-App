import 'dart:convert';
import 'dart:developer';

import 'package:astrology_app/modals/horoscope.dart';
import 'package:http/http.dart' as http;

class HoroscopeApiHelper {
  HoroscopeApiHelper._();

  static final HoroscopeApiHelper horoscopeApiHelper = HoroscopeApiHelper._();

  //Todo: Fetch love Data
  Future<Horoscope?> todayLoveData({required String sunShineName,required String day}) async {

    http.Response response = await http.get(
        Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope-love/$sunShineName/$day"),
        headers: {
          "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
          "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
        }
    );
    if(response.statusCode == 200)
    {
      Map decodedData = jsonDecode(response.body);

      String data = decodedData[sunShineName];

      Horoscope horoscope = Horoscope(data: data);

      log(horoscope.data,name: "$sunShineName Data");

      return horoscope;
    }
    return null;
  }

  //Todo: Fetch career Data
  Future<Horoscope?> todayCareerData({required String sunShineName,required String day}) async {

    http.Response response = await http.get(
        Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope-career/$sunShineName/$day"),
        headers: {
          "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
          "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
        }
    );
    if(response.statusCode == 200)
    {
      Map decodedData = jsonDecode(response.body);

      String data = decodedData[sunShineName];

      Horoscope horoscope = Horoscope(data: data);



      return horoscope;
    }
    return null;
  }


  //Todo: Fetch today's Data
  Future<Horoscope?> todayData({required String sunShineName,required String day}) async {

    http.Response response = await http.get(
      Uri.parse("https://astro-daily-live-horoscope.p.rapidapi.com/horoscope/$sunShineName/$day"),
      headers: {
        "X-RapidAPI-Key": "df304003camshe747a2d40a2a904p166caajsnb80009135309",
        "X-RapidAPI-Host": "astro-daily-live-horoscope.p.rapidapi.com"
      }
    );
    if(response.statusCode == 200)
      {
        Map decodedData = jsonDecode(response.body);

        String data = decodedData[sunShineName];

        Horoscope horoscope = Horoscope(data: data);



        return horoscope;
      }
    return null;
  }


  //Todo: Fetch Weekly data

  //Todo: Fetch Monthly Data
}