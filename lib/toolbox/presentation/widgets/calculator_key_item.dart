import 'package:flutter/material.dart';
import 'package:ToolBox/toolbox/presentation/pages/calculator.dart';
import 'package:ToolBox/toolbox/presentation/providers/calculator_model.dart';
import 'package:provider/provider.dart';

class KeyItem extends StatelessWidget {
  final String _text;
  const KeyItem(this._text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.deepPurple),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FlatButton(
              color: Colors.yellow,
              child: Text(
                _text,
                style: Calculator.buttonTextStyles,
              ),
              onPressed: () {
                Provider.of<CalculatorModel>(context, listen: false)
                    .tapped(_text);
              },
            ),
          ),
        ),
      ),
    );
  }
}
