import '../enums/alcohol_list.dart';
import '../enums/glasses.dart';

class Drink {
  Drink({required this.glass, required this.alcohol});

  final Glass glass;
  final Alcohol alcohol;
}
