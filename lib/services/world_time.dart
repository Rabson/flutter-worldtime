import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to asset flag icon
  String url;  // location url for api end point
  bool isDaytime;
  WorldTime({ this.location ,this.flag ,this.url });

  Future<void> getTime() async {
    String uri = 'http://worldtimeapi.org/api/timezone/$url';
    try {
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // get data from string
      String dataTime = data["utc_datetime"];
      String offsetHour = data["utc_offset"].substring(1,3);
      String offsetMin = data["utc_offset"].substring(4,6);

      DateTime now = DateTime.parse(dataTime);
      now = now.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));

      // set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true :false;
      time = DateFormat.jm().format(now);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    } catch(e) {
      print("error $e");
      time =  "Fail to get data.";
    }

  }

}

// example
// WordTime instance = WordTime(location: "Berlin", flag: "germany.png", url:"Europe/Berlin");