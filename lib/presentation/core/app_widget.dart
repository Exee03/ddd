import 'package:auto_route/auto_route.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ddd/application/auth/auth_bloc.dart';
import 'package:ddd/injection.dart';
import 'package:ddd/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'SiteMan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        builder: ExtendedNavigator(router: Router()),
      ),
    );
    // return FutureBuilder(
    //   // Initialize FlutterFire:
    //   future: _initialization,
    //   builder: (context, snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       return const MaterialApp(
    //         home: Scaffold(
    //           body: Center(
    //             child: Text("Error"),
    //           ),
    //         ),
    //       );
    //     }

    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    // return MultiBlocProvider(
    //             providers: [
    //               BlocProvider(
    //                 create: (context) => getIt<AuthBloc>()
    //                   ..add(const AuthEvent.authCheckRequested()),
    //               )
    //             ],
    //             child: MaterialApp(
    //               title: 'SiteMan',
    //               debugShowCheckedModeBanner: false,
    //               theme: ThemeData(
    //                 // This is the theme of your application.
    //                 //
    //                 // Try running your application with "flutter run". You'll see the
    //                 // application has a blue toolbar. Then, without quitting the app, try
    //                 // changing the primarySwatch below to Colors.green and then invoke
    //                 // "hot reload" (press "r" in the console where you ran "flutter run",
    //                 // or simply save your changes to "hot reload" in a Flutter IDE).
    //                 // Notice that the counter didn't reset back to zero; the application
    //                 // is not restarted.
    //                 primarySwatch: Colors.blue,
    //                 // This makes the visual density adapt to the platform that you run
    //                 // the app on. For desktop platforms, the controls will be smaller and
    //                 // closer together (more dense) than on mobile platforms.
    //                 visualDensity: VisualDensity.adaptivePlatformDensity,
    //                 inputDecorationTheme: InputDecorationTheme(
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //               ),
    //               builder: ExtendedNavigator(router: Router()),
    //             ),
    //           );
    //     }

    //     // Otherwise, show something whilst waiting for initialization to complete

    //     return const MaterialApp(
    //       home: Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
