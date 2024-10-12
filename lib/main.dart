import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/config/app_theme.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/header_fragment_cubit/header_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/query_fragment_cubit/query_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/result_fragment_cubit/result_fragment_cubit.dart';
import 'package:requester/firebase_options.dart';

import 'features/feature_requester/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ///  init locator
  await setupDI();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: En.appName,
      theme: appThemeData(),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (_) => di<RequestTypeListCubit>()),
        BlocProvider(create: (_) => di<HomePageBloc>()),
        BlocProvider(create: (_) => di<QueryFragmentCubit>()),
        BlocProvider(create: (_) => di<HeaderFragmentCubit>()),
        BlocProvider(create: (_) => di<ResultFragmentCubit>())
      ], child: const HomePage()),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
