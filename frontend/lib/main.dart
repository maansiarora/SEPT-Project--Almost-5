import 'package:flutter/material.dart';
import 'pages/choiceLogin.dart';

void main() => runApp(MaterialApp(initialRoute: '/choiceLogin', routes: {
      '/choiceLogin': (context) => const choiceLogin(),
    }));
