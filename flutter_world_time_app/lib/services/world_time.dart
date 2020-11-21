import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  WorldTime({this.location, this.flag, this.url});
  String location;
  String time;
  String date;
  String flag;
  String url;
  bool isDaytime;

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      // print(response.body);

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offsetHrs = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      int minutes = (int.parse(offsetHrs) * 60) + int.parse(offsetMin);
      print(datetime);
      // print(minutes);

      DateTime now = DateTime.parse(datetime);
      if (data['utc_offset'][0] == '+') {
        now = now.add(Duration(minutes: minutes));
      } else {
        now = now.subtract(Duration(minutes: minutes));
      }
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      date = DateFormat.yMEd().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Could not get the time data!';
    }
  }
}
