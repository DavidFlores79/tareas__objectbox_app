import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:objectbox_app/helpers/object_box.dart';
import 'package:objectbox_app/models/entities.dart';
import 'package:objectbox_app/screens/task_creen.dart';
import 'package:objectbox_app/screens/user_creen.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ObjectBox Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontStyle: FontStyle.italic,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          // ···
          brightness: Brightness.light,
        ),
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge:
              const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 28,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.roboto(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      // home: TaskScreen(),
      initialRoute: TaskScreen.routeName,
      routes: {
        UserScreen.routeName: (context) => UserScreen(),
        TaskScreen.routeName: (context) => TaskScreen()
      },
    );
  }
}
