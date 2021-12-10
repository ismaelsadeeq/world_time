import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      var navUrl = Uri.https(
          'www.worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //create Date time object
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now); // set the time
    } catch (e) {
      print("error is $e");
      time = "something went wrong";
    }
  }
}
