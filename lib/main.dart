import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_clubs/ui/launch_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LuClubs());
}

class LuClubs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LU Clubs',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LaunchScreen(),
        );
      },
    );
  }
}
