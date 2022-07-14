import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starter_project/providers/global_provider.dart';
import 'package:starter_project/providers/local_provider.dart';
import 'package:starter_project/providers/theme_provider.dart';

// ignore: non_constant_identifier_names
final List<SingleChildStatelessWidget> providers_setup =
    <SingleChildStatelessWidget>[
  ChangeNotifierProvider<GlobalProvider>(
    create: (BuildContext context) => GlobalProvider(),
  ),
  ChangeNotifierProvider<LocaleProvider>(
    create: (BuildContext context) => LocaleProvider(),
  ),
  ChangeNotifierProvider<ThemeProvider>(
    create: (BuildContext context) => ThemeProvider(),
  ),
  /* -------------------------------------------------------------------------- */
  /*                              Your providers here                          */
  /* -------------------------------------------------------------------------- */
];
