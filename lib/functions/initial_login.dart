import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_maps/main.dart';

void initialLogin()  {
 FirebaseAuth.instance.authStateChanges().listen(( user) {
    if (user == null) {
      initialRoute = loginScreen;
    } else {
      initialRoute = mapScreen;
    }
  });
} 