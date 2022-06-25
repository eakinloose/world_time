import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  dynamic location;
  dynamic time;
  dynamic url;
  bool isDayTime = true;

  WorldTime({this.location, this.url});

  Future<void> getTime () async {
    var fetchUrl = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
    Response response = await get(fetchUrl);
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now  = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour>5 && now.hour<23 ? true : false;
    time = DateFormat.jm().format(now);
  //  formats the time to be more readable: DateFormat.jm().format(now);
  }
}
