import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/presentation/providers/calculator_model.dart';
import 'package:ToolBox/toolbox/presentation/widgets/calculator_key_item.dart';
import 'package:ToolBox/toolbox/presentation/widgets/calculator_operation_screen.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  static const String routeName = "/calculator";
  Calculator({Key key}) : super(key: key);
  static TextStyle buttonTextStyles = GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  );
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  CalculatorModel model;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<CalculatorModel>(context, listen: false);
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 550,
            child: OperationScreen(),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              KeyItem("+"),
              KeyItem("-"),
              KeyItem("x"),
              KeyItem("/"),
              KeyItem("."),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              KeyItem("7"),
              KeyItem("8"),
              KeyItem("9"),
              KeyItem("("),
              KeyItem(")"),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              KeyItem("4"),
              KeyItem("5"),
              KeyItem("6"),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 208,
                  height: 100,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.deepPurple)),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: FlatButton(
                        color: Colors.yellow,
                        child: Text(
                          ToolboxLocalizations.of(context).calculatorClear,
                          style: Calculator.buttonTextStyles,
                        ),
                        onPressed: () {
                          model.clearCalculator();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              KeyItem("1"),
              KeyItem("2"),
              KeyItem("3"),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 208,
                  height: 100,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.deepPurple)),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: FlatButton(
                        color: Colors.yellow,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          ToolboxLocalizations.of(context).calculatorCalculate,
                          style: Calculator.buttonTextStyles,
                        ),
                        onPressed: () {
                          model.calculate();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              SizedBox(
                width: 104,
                height: 100,
              ),
              KeyItem("0"),
              SizedBox(
                width: 104,
                height: 100,
              ),
              SizedBox(
                width: 104,
                height: 100,
              ),
              SizedBox(
                width: 104,
                height: 100,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
