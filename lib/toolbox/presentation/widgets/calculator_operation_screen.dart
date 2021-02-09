import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToolBox/toolbox/presentation/providers/calculator_model.dart';
import 'package:provider/provider.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({
    Key key,
  }) : super(key: key);

  @override
  _OperationScreenState createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.deepPurple),
        borderRadius: BorderRadius.all(Radius.elliptical(10, 40)),
        color: Colors.white70,
      ),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.centerRight,
      child: Consumer<CalculatorModel>(
        builder: (context, value, child) => Text(
          value.calculation.toString(),
          maxLines: 1,
          style: GoogleFonts.audiowide(
              fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5),
        ),
      ),
    );
  }
}
