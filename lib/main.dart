import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tokoto/App/blocs/Basket/basket_bloc.dart';
import 'package:tokoto/App/blocs/Filters/filters_bloc.dart';
import 'package:tokoto/App/config/routes.dart';
import 'package:tokoto/App/style/theme.dart';
import 'package:tokoto/Screens/Splash_Screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FiltersBloc()
              ..add(
                LoadFilter(),
              ),),
              BlocProvider(create: ((context) => BasketBloc()..add(StartBasket())),),
      ],
      child: GetMaterialApp(
        title: 'TOKOTO',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const Splash_Screen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
