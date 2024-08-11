import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/screens/login_screen.dart';

import 'constnats/strings.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}