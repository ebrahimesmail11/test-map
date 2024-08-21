import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/app.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'functions/initial_login.dart';


late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initialLogin() ;
   await ScreenUtil.ensureScreenSize();
  runApp( MyApp(appRouter: AppRouter(),));
}
