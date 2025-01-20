import 'package:attendace_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      //sebelum kita pake layanan dri firebase tuh kita harus panggil initualizeapp dulu untuk memasukkan data
      //data diambil dari file google-sevices.json
      apiKey: 'AIzaSyC4_HXbMLHUljw9gLfQ7q_AS4KnVWeeHrA',  //current key
      appId: '1:642151208791:android:f7e7a011dec08f49a2d012',  //mobile sdk_app_id
      messagingSenderId: '"642151208791', //project number
      projectId: 'attendace-app-a4b16' //project id)
  )
  );
  runApp(const AttendanceApp());
  }

  class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
        ),
        home: const HomeScreen(),
    );
  }
}
