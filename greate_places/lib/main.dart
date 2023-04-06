import 'package:flutter/material.dart';
import 'package:greate_places/providers/greate_places.dart';
import 'package:greate_places/screen/place_detail_screen.dart';
import 'package:greate_places/screen/place_form_screen.dart';
import 'package:greate_places/screen/place_list_screen.dart';
import 'package:greate_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: "Greate Places",
        theme: ThemeData(
          primaryColor: Colors.indigo,
          hintColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL: (ctx) => const PlaceDetailScreen()
        },
      ),
    );
  }
}
