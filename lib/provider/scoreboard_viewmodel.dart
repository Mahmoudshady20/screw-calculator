import 'package:flutter/foundation.dart';

class ScoreBoardViewModel extends ChangeNotifier {
  List<int> values1 = [];
  List<int> values2 = [];
  List<int> values3 = [];
  List<int> values4 = [];
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int numberOfPlayer = 2;
  void addValueInList2Player(
    String number1,
    String number2,
  ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    sum1 = 0;
    sum2 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
    }
    notifyListeners();
  }
  void addValueInList3Player(
      String number1,
      String number2,
      String number3,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
    }
    notifyListeners();
  }
  void addValueInList4Player(
      String number1,
      String number2,
      String number3,
      String number4,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
      sum4 += values4[i];
    }
    notifyListeners();
  }
  void clear() {
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    values1.clear();
    values2.clear();
    values3.clear();
    values4.clear();
    notifyListeners();
  }

  void updateNumberOfPlayer(int number){
    numberOfPlayer = number;
    notifyListeners();
  }
}
