import 'package:flutter/foundation.dart';
import 'package:skrocalc/provider/name_model.dart';

class ScoreBoardViewModel extends ChangeNotifier {
  NameModel? nameModel;

  updateName(NameModel names) {
    nameModel = names;
    notifyListeners();
  }

  List<int> values1 = [];
  List<int> values2 = [];
  List<int> values3 = [];
  List<int> values4 = [];
  List<int> values5 = [];
  List<int> values6 = [];
  List<int> values7 = [];
  List<int> values8 = [];
  List<int> valuesSahebSahbo1 = [];
  List<int> valuesSahebSahbo2 = [];
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int sum5 = 0;
  int sum6 = 0;
  int sum7 = 0;
  int sum8 = 0;
  int sumSahebSahbo1 = 0;
  int sumSahebSahbo2 = 0;
  int numberOfPlayer = 2;

  void deleteLastElement() {
    if (numberOfPlayer == 2) {
      values1.removeLast();
      values2.removeLast();
      sum1 = 0;
      sum2 = 0;
      for (int i = 0; i < values1.length; i++) {
        sum1 += values1[i];
        sum2 += values2[i];
      }
    } else if (numberOfPlayer == 3) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      sum1 = 0;
      sum2 = 0;
      sum3 = 0;
      for (int i = 0; i < values1.length; i++) {
        sum1 += values1[i];
        sum2 += values2[i];
        sum3 += values3[i];
      }
    } else if (numberOfPlayer == 4) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      values4.removeLast();
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
    }
    else if (numberOfPlayer == 9) {
      valuesSahebSahbo1.removeLast();
      valuesSahebSahbo2.removeLast();
      sumSahebSahbo1 = 0;
      sumSahebSahbo2 = 0;
      for (int i = 0; i < valuesSahebSahbo1.length; i++) {
        sumSahebSahbo1 += valuesSahebSahbo1[i];
        sumSahebSahbo2 += valuesSahebSahbo2[i];
      }
    }
    else if (numberOfPlayer == 5) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      values4.removeLast();
      values5.removeLast();
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
    } else if (numberOfPlayer == 6) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      values4.removeLast();
      values5.removeLast();
      values6.removeLast();
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
    } else if (numberOfPlayer == 7) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      values4.removeLast();
      values5.removeLast();
      values6.removeLast();
      values7.removeLast();
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
    } else if (numberOfPlayer == 8) {
      values1.removeLast();
      values2.removeLast();
      values3.removeLast();
      values4.removeLast();
      values5.removeLast();
      values6.removeLast();
      values7.removeLast();
      values8.removeLast();
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
    }
    notifyListeners();
  }

  void addValueInList2Player(
    String number1,
    String number2,
  ) {
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    valuesConvert.add(int.parse(number4));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
    if (min == int.parse(number4)) {
      values4.add(0);
    } else if (min != int.parse(number4)) {
      values4.add(int.parse(number4));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    valuesConvert.add(int.parse(number4));
    valuesConvert.add(int.parse(number5));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
    if (min == int.parse(number4)) {
      values4.add(0);
    } else if (min != int.parse(number4)) {
      values4.add(int.parse(number4));
    }
    if (min == int.parse(number5)) {
      values5.add(0);
    } else if (min != int.parse(number5)) {
      values5.add(int.parse(number5));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    valuesConvert.add(int.parse(number4));
    valuesConvert.add(int.parse(number5));
    valuesConvert.add(int.parse(number6));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
    if (min == int.parse(number4)) {
      values4.add(0);
    } else if (min != int.parse(number4)) {
      values4.add(int.parse(number4));
    }
    if (min == int.parse(number5)) {
      values5.add(0);
    } else if (min != int.parse(number5)) {
      values5.add(int.parse(number5));
    }
    if (min == int.parse(number6)) {
      values6.add(0);
    } else if (min != int.parse(number6)) {
      values6.add(int.parse(number6));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    valuesConvert.add(int.parse(number4));
    valuesConvert.add(int.parse(number5));
    valuesConvert.add(int.parse(number6));
    valuesConvert.add(int.parse(number7));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
    if (min == int.parse(number4)) {
      values4.add(0);
    } else if (min != int.parse(number4)) {
      values4.add(int.parse(number4));
    }
    if (min == int.parse(number5)) {
      values5.add(0);
    } else if (min != int.parse(number5)) {
      values5.add(int.parse(number5));
    }
    if (min == int.parse(number6)) {
      values6.add(0);
    } else if (min != int.parse(number6)) {
      values6.add(int.parse(number6));
    }
    if (min == int.parse(number7)) {
      values7.add(0);
    } else if (min != int.parse(number7)) {
      values7.add(int.parse(number7));
    }
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
    List<int> valuesConvert = [];
    valuesConvert.add(int.parse(number1));
    valuesConvert.add(int.parse(number2));
    valuesConvert.add(int.parse(number3));
    valuesConvert.add(int.parse(number4));
    valuesConvert.add(int.parse(number5));
    valuesConvert.add(int.parse(number6));
    valuesConvert.add(int.parse(number7));
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == int.parse(number1)) {
      values1.add(0);
    } else if (min != int.parse(number1)) {
      values1.add(int.parse(number1));
    }
    if (min == int.parse(number2)) {
      values2.add(0);
    } else if (min != int.parse(number2)) {
      values2.add(int.parse(number2));
    }
    if (min == int.parse(number3)) {
      values3.add(0);
    } else if (min != int.parse(number3)) {
      values3.add(int.parse(number3));
    }
    if (min == int.parse(number4)) {
      values4.add(0);
    } else if (min != int.parse(number4)) {
      values4.add(int.parse(number4));
    }
    if (min == int.parse(number5)) {
      values5.add(0);
    } else if (min != int.parse(number5)) {
      values5.add(int.parse(number5));
    }
    if (min == int.parse(number6)) {
      values6.add(0);
    } else if (min != int.parse(number6)) {
      values6.add(int.parse(number6));
    }
    if (min == int.parse(number7)) {
      values7.add(0);
    } else if (min != int.parse(number7)) {
      values7.add(int.parse(number7));
    }
    if (min == int.parse(number8)) {
      values8.add(0);
    } else if (min != int.parse(number8)) {
      values8.add(int.parse(number8));
    }
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
    sumSahebSahbo1 = 0;
    sumSahebSahbo2 = 0;
    values1.clear();
    values2.clear();
    values3.clear();
    values4.clear();
    values5.clear();
    values6.clear();
    values7.clear();
    values8.clear();
    valuesSahebSahbo1.clear();
    valuesSahebSahbo2.clear();
    notifyListeners();
  }

  void updateNumberOfPlayer(int number) {
    numberOfPlayer = number;
    notifyListeners();
  }
  void addValueInListSahebSahbo(
      String number1,
      String number2,
      String number3,
      String number4,
      ){
    List<int> valuesConvert = [];
    values1.add(int.parse(number1));
    values2.add(int.parse(number2));
    values3.add(int.parse(number3));
    values4.add(int.parse(number4));
    valuesSahebSahbo1.add(values1.last + values2.last);
    valuesSahebSahbo2.add(values3.last + values4.last);
    valuesConvert.add(valuesSahebSahbo1.last);
    valuesConvert.add(valuesSahebSahbo2.last);
    int min = valuesConvert[0];
    for (int i = 0; i < valuesConvert.length; i++) {
      if (valuesConvert[i] <= min) {
        min = valuesConvert[i];
      }
    }
    if (min == valuesSahebSahbo1.last) {
      valuesSahebSahbo1.removeLast();
      valuesSahebSahbo1.add(0);
    }
    if (min == int.parse(number2)) {
      valuesSahebSahbo2.removeLast();
      valuesSahebSahbo2.add(0);
    }
    sumSahebSahbo1 = 0;
    sumSahebSahbo2 = 0;
    for (int i = 0; i < valuesSahebSahbo1.length; i++) {
      sumSahebSahbo1 += valuesSahebSahbo1[i];
      sumSahebSahbo2 += valuesSahebSahbo2[i];
    }
    notifyListeners();
  }
}
