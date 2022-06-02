import 'package:flutter/material.dart';
import 'package:mini_apps/common/style.dart';
import 'package:mini_apps/pages/home_page.dart';
import 'package:mini_apps/viewModel/category_view_model.dart';
import 'package:provider/provider.dart';
import 'viewModel/product_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CategoriesViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(colorScheme: kColorScheme),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
