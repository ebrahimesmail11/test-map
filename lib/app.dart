import 'package:flutter/material.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,  child)  {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
           primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: initialRoute ,
        );
      }
    );
  }
}
