import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flight_translations_library/flight_translations_library.dart';
import 'package:flight_common_widgets_library/flight_common_widgets_library.dart';
import 'package:flight_core_models_library/flight_core_models_library.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        const Locale('en', 'US'), // English - default locale
        const Locale('es', 'ES'), // Spanish
        const Locale('fr', 'FR'), // French
      ],
      localizationsDelegates: [
        AppLocalizations.delegate, //  loads translations from our JSON files
        GlobalMaterialLocalizations.delegate, // built-in: for basic text of Material widgets
        GlobalCupertinoLocalizations.delegate, // built-in: for basic text of Cupertino widgets
        GlobalWidgetsLocalizations.delegate, // built-in: for text direction LTR/RTL
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context).translate('app_title_passenger')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${AppLocalizations.of(context).translate('msg_welcome')}'),
            SizedBox(height: 20.0),
            FlightDisplay(
              flightDetails: FlightDetails(
                airline: "JAL",
                flightNumber: "23",
                departureDate: "2021-06-16",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
