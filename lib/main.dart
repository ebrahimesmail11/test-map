import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/app.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_maps/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen(( user) {
    if (user == null) {
      initialRoute = loginScreen;
    } else {
      initialRoute = mapScreen;
    }
  });
   await ScreenUtil.ensureScreenSize();
  runApp( MyApp(appRouter: AppRouter(),));
}


