// import 'package:chatty_app/firebase_options.dart';
import 'package:chatty_app/firebase_options.dart';
import 'package:chatty_app/global.dart';
import 'package:chatty_app/utils/style/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utils/routes/pages.dart';

// com.example.app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Chatty',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
/*
Platform  Firebase App Id
Platform  Firebase App Id
android   1:100125426577:android:6851e5d60bc17ef0379030
ios       1:100125426577:ios:98eb344f38d5855c379030

Platform  Firebase App Id
android   1:100125426577:android:a322ed3addc63abd379030
ios       1:100125426577:ios:98eb344f38d5855c379030

Alias name: androiddebugkey
Creation date: Oct 4, 2024
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Oct 04 12:29:30 EEST 2024 until: Sun Sep 27 12:29:30 EEST 2054
Certificate fingerprints:
         SHA1: DB:C0:54:87:F1:A7:C3:B2:2D:DF:5E:9F:2F:1B:E3:5E:88:1F:36:3F
         SHA256: 2F:83:54:D1:78:69:81:9E:C8:F2:CD:CF:F2:A9:03:93:E7:9D:AD:35:57:DE:30:E7:95:5B:2A:24:B0:E8:BC:0D
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1


 */