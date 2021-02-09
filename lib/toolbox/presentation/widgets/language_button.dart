import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToolBox/toolbox/presentation/providers/language_model.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({
    Key key,
  }) : super(key: key);

  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

int _value = 0;

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: DropdownButton(
        items: [
          DropdownMenuItem(
            child: Text("English"),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text("Türkçe"),
            value: 1,
          ),
        ],
        elevation: 0,
        dropdownColor: Colors.grey[300],
        style: GoogleFonts.raleway(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        icon: Icon(Icons.language),
        isExpanded: true,
        value: _value,
        onChanged: (value) {
          Provider.of<LanguageModel>(context, listen: false).locale =
              value == 0 ? "en" : "tr";
          _value = value;
        },
      ),
    );
  }
}
