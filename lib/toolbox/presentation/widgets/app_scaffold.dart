import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final BuildContext context;
  final List<Widget> actions;
  final Widget child;
  final ThemeData theme;
  AppScaffold(this.title, this.context, {this.actions, this.child, this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: theme.primaryColorDark,
        ),
        textTheme: theme.appBarTheme.textTheme,
        title: Text(
          title,
          style: TextStyle(color: theme.primaryColorDark),
        ),
        actions: actions,
      ),
      body: child,
    );
  }
}
