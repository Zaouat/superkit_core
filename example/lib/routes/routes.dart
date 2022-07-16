import 'package:flutter/Material.dart';
import 'package:superkit_project/pages/home.dart';
import 'package:superkit_core/superkit_core.dart';

GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) => MyHomePage(),
  ),

  /* -------------------------------------------------------------------------- */
  /*                                 Your routes here                          */
  /* -------------------------------------------------------------------------- */
]);
