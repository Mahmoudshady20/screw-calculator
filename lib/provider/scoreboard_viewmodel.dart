import 'package:flutter/foundation.dart';

class ScoreBoardViewModel extends ChangeNotifier {
  List<int> values1 = [];
  List<int> values2 = [];
  List<int> values3 = [];
  List<int> values4 = [];
  List<int> values5 = [];
  List<int> values6 = [];
  List<int> values7 = [];
  List<int> values8 = [];
  List<String> names = [];
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int sum5 = 0;
  int sum6 = 0;
  int sum7 = 0;
  int sum8 = 0;
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

  void addValueInList5Player(
      String number1,
      String number2,
      String number3,
      String number4,
      String number5,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    values5.add(int.parse(number5));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    sum5 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
      sum4 += values4[i];
      sum5 += values5[i];
    }
    notifyListeners();
  }
  void addValueInList6Player(
      String number1,
      String number2,
      String number3,
      String number4,
      String number5,
      String number6,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    values5.add(int.parse(number5));
    values6.add(int.parse(number6));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    sum5 = 0;
    sum6 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
      sum4 += values4[i];
      sum5 += values5[i];
      sum6 += values6[i];
    }
    notifyListeners();
  }
  void addValueInList7Player(
      String number1,
      String number2,
      String number3,
      String number4,
      String number5,
      String number6,
      String number7,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    values5.add(int.parse(number5));
    values6.add(int.parse(number6));
    values7.add(int.parse(number7));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    sum5 = 0;
    sum6 = 0;
    sum7 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
      sum4 += values4[i];
      sum5 += values5[i];
      sum6 += values6[i];
      sum7 += values7[i];
    }
    notifyListeners();
  }
  void addValueInList8Player(
      String number1,
      String number2,
      String number3,
      String number4,
      String number5,
      String number6,
      String number7,
      String number8,
      ) {
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    values5.add(int.parse(number5));
    values6.add(int.parse(number6));
    values7.add(int.parse(number7));
    values8.add(int.parse(number8));
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    sum5 = 0;
    sum6 = 0;
    sum7 = 0;
    sum8 = 0;
    for (int i = 0; i < values1.length; i++) {
      sum1 += values1[i];
      sum2 += values2[i];
      sum3 += values3[i];
      sum4 += values4[i];
      sum5 += values5[i];
      sum6 += values6[i];
      sum7 += values7[i];
      sum8 += values8[i];
    }
    notifyListeners();
  }
  void clear() {
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    sum4 = 0;
    sum5 = 0;
    sum6 = 0;
    sum7 = 0;
    sum8 = 0;
    values1.clear();
    values2.clear();
    values3.clear();
    values4.clear();
    values5.clear();
    values6.clear();
    values7.clear();
    values8.clear();
    notifyListeners();
  }

  void updateNumberOfPlayer(int number){
    numberOfPlayer = number;
    notifyListeners();
  }
}
