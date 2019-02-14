# elapsed_time
Dart package to convert 2 Datetimes to human-friendly formatted string.

# installation

```
# pubspec.yaml

dependencies:
  elapsed_time: ^1.0.0

```

Then execute `$ pub get`

```
// hoge.dart
import 'package:elapsed_time/elapsed_time.dart';
```

# usage

```
var formatter = ElapsedTime();
formatter.fromAt(from: DateTime(2019,2,14,0,0,3), at: DateTime(2019,2,14,0,0,0)); // => "3秒前"
formatter.fromAt(from: DateTime(2019,2,14,0,3,0), at: DateTime(2019,2,14,0,0,0)); // => "3分前"
formatter.fromAt(from: DateTime(2019,2,14,3,0,0), at: DateTime(2019,2,14,0,0,0)); // => "3時間前"
formatter.fromAt(from: DateTime(2019,2,17,0,0,0), at: DateTime(2019,2,14,0,0,0)); // => "3日前"

var formatter = ElapsedTime(format1: 'yy-MM-dd', format2: 'MM-dd H');
formatter.fromAt(from: DateTime(2019,4,17,0,0,0), at: DateTime(2019,2,14,0,0,0)); // => "02-17 0"
formatter.fromAt(from: DateTime(2020,2,17,0,0,0), at: DateTime(2019,2,14,0,0,0)); // => "20-02-14"
```

# todo
- i18n
- not only `ago`, but `since`
