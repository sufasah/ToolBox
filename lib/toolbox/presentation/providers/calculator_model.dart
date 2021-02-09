import 'package:flutter/cupertino.dart';

class CalculatorModel extends ChangeNotifier {
  StringBuffer calculation = StringBuffer();
  int unpairedParNum = 0;
  bool secondDot = false;

  void tapped(String val) {
    if (checkWritable(val)) calculation.write(val);
    notifyListeners();
  }

  bool checkWritable(val) {
    final String str = calculation.toString();
    if (str.isEmpty) {
      if (isDigit(val) || isOneOfThem(val, "+-(")) {
        if (val == "(") unpairedParNum++;
        return true;
      }
      return false;
    }

    final String lastChar = str[str.length - 1];

    if (isDigit(lastChar) && isOneOfThem(val, "0123456789.+-x/)")) {
      if (val == ")") {
        if (unpairedParNum > 0)
          unpairedParNum--;
        else
          return false;
      }
      if (!isDigit(val) && val != '.') secondDot = false;
      if (val == '.') {
        if (secondDot)
          return false;
        else
          secondDot = true;
      }
      return true;
    }

    if (isOneOfThem(lastChar, "+-x/") && isOneOfThem(val, "0123456789(")) {
      if (val == '(') {
        secondDot = false;
        unpairedParNum++;
      }

      return true;
    }

    if (isOneOfThem(lastChar, "(") && isOneOfThem(val, "0123456789(+-")) {
      if (val == '(') unpairedParNum++;
      if (!isDigit(val)) secondDot = false;
      return true;
    }

    if (isOneOfThem(lastChar, ")") && isOneOfThem(val, "+-x/)")) {
      if (val == ')') {
        if (unpairedParNum == 0) return false;
        unpairedParNum--;
        return true;
      }
      secondDot = false;
      return true;
    }

    if (lastChar == '.' && isDigit(val)) {
      return true;
    }
    return false;
  }

  bool isDigit(char) {
    return isOneOfThem(char, "0123456789");
  }

  bool isOperator(char) {
    return isOneOfThem(char, "+-x/");
  }

  bool isOneOfThem(char, chars) {
    for (int i = 0; i < chars.length; i++) if (chars[i] == char) return true;
    return false;
  }

  bool isNoneOfThem(char, chars) {
    bool res = true;
    for (int i = 0; i < chars.length; i++)
      if (chars[i] == char) {
        res = false;
        break;
      }

    return res;
  }

  void clearCalculator() {
    calculation = StringBuffer();
    this.unpairedParNum = 0;
    this.secondDot = false;
    notifyListeners();
  }

  double makeCalculationPar(String part) {
    if (part[0] == '(')
      return double.parse(
          makeCalculationSumSub(part.substring(1, part.length - 1)));
    else
      return double.parse(part);
  }

  double makeCalculationMulDiv(String part) {
    if (part == "") return 0;
    List<String> mulDivs = [];
    List<String> ops = [];
    int parDepth = 0;
    int lastOperator = -1;
    for (int i = 0; i <= part.length; i++) {
      if (parDepth == 0 && (part.length == i || isOneOfThem(part[i], "x/"))) {
        mulDivs.add(part.substring(lastOperator + 1, i));
        if (i != part.length) ops.add(part[i]);
        lastOperator = i;
      }
      if (i != part.length && part[i] == '(') parDepth++;
      if (i != part.length && part[i] == ')') parDepth--;
    }
    double dres = 0;
    dres += makeCalculationPar(mulDivs[0]);
    for (int i = 1; i < mulDivs.length; i++) {
      if (ops[i - 1] == "x")
        dres *= makeCalculationPar(mulDivs[i]);
      else
        dres /= makeCalculationPar(mulDivs[i]);
    }
    return dres;
  }

  String makeCalculationSumSub(String part) {
    List<String> sumSubs = [];
    List<String> ops = [];
    int parDepth = 0;
    int lastOperator = -1;
    for (int i = 0; i <= part.length; i++) {
      if (parDepth == 0 && (part.length == i || isOneOfThem(part[i], "+-"))) {
        sumSubs.add(part.substring(lastOperator + 1, i));
        if (i != part.length) ops.add(part[i]);
        lastOperator = i;
      }
      if (i != part.length && part[i] == '(') parDepth++;
      if (i != part.length && part[i] == ')') parDepth--;
    }
    double dres = 0;
    dres += makeCalculationMulDiv(sumSubs[0]);
    for (int i = 1; i < sumSubs.length; i++) {
      if (ops[i - 1] == "+")
        dres += makeCalculationMulDiv(sumSubs[i]);
      else
        dres -= makeCalculationMulDiv(sumSubs[i]);
    }
    return dres.toStringAsFixed(6);
  }

  void calculate() {
    String str = calculation.toString();
    String res;
    try {
      if (str == "")
        res = "0";
      else
        res = makeCalculationSumSub(str);
    } catch (e) {
      res = "Error";
    }
    clearCalculator();
    calculation.write(res);
    notifyListeners();
  }
}
