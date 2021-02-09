import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String pageName;
  const MenuItem(
    this.text,
    this.pageName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: 200,
        height: 60,
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColorDark,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () => pushPage(context, pageName),
        ),
      ),
    );
  }

  void pushPage(BuildContext context, String pageName) {
    Navigator.pushNamed(context, pageName);
  }
}
