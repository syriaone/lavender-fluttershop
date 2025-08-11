import 'package:intl/intl.dart';

class PriceFmt {
  static String syp(num amount) {
    final f = NumberFormat('#,##0', 'ar_SY');
    return '${f.format(amount)} SYP';
  }
}
