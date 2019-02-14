import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

// enum Locale {
//   ja,
//   en
// }

class ElapsedTime {
  //Locale locale = Locale.en;
  DateFormat formatter1 = DateFormat('yyyy/MM/dd');
  DateFormat formatter2 = DateFormat('MM/dd');
  ElapsedTime({String format1 = null, String format2 = null}){
    if (format1 != null) {
      this.formatter1 = DateFormat(format1);
    }
    if (format2 != null) {
      this.formatter2 = DateFormat(format2);
    }
  }

  String fromAt({@required DateTime from, @required DateTime at}) {
    final sec = from.difference(at).inSeconds;
    if (sec >= 60 * 60 * 24 * 30 * 12) {
      return formatter1.format(from);
    } else if (sec >= 60 * 60 * 24 * 30) {
      return formatter2.format(from);
    } else {
      return _ElapsedTimeDuration(seconds: sec).tostr();
    }
  }

  String fromNow({@required DateTime at}){
    return fromAt(from: DateTime.now(), at: at);
  }
}

class _ElapsedTimeDuration extends Duration{
  _ElapsedTimeDuration({int seconds}): super(seconds: seconds);
  String tostr() {
    final sec = this.inSeconds;
    if (sec >= 60 * 60 * 24) {
      return '${this.inDays.toString()}日前';
    } else if (sec >= 60 * 60) {
      return '${this.inHours.toString()}時間前';
    } else if (sec >= 60) {
      return '${this.inMinutes.toString()}分前';
    } else {
      return '$sec秒前';
    }
  }
}