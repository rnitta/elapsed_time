import "package:test/test.dart";
import 'package:elapsed_time/elapsed_time.dart';

main() {
 group("pass no formats", () {
      test(".fromAt 1sec", () {
      final from = DateTime(2019,2,14,0,0,2);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('1秒前'));
    });

    test(".fromAt 2min", () {
      final from = DateTime(2019,2,14,0,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('2分前'));
    });

    test(".fromAt 3hours", () {
      final from = DateTime(2019,2,14,3,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('3時間前'));
    });

    test(".fromAt 4days", () {
      final from = DateTime(2019,2,18,3,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('4日前'));
    });

    test(".fromAt more than 1 month ago", () {
      final from = DateTime(2019,3,18,3,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('03/18'));
    });

    test(".fromAt more than 1 year ago", () {
      final from = DateTime(2020,3,18,3,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime();
      expect(formatter.fromAt(from: from, at: at), equals('2020/03/18'));
    });
 });
  group("specify formats", () {
    test(".fromAt more than 1 year ago", () {
      final from = DateTime(2020,3,18,3,2,1);
      final at = DateTime(2019,2,14,0,0,1);
      final formatter = ElapsedTime(format1: 'yy年M月d日 H時m分');
      expect(formatter.fromAt(from: from, at: at), equals('20年3月18日 3時2分'));
    });
  });
}