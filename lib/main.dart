import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potea_app/app/potea.dart';
import 'package:potea_app/core/services/bloc/custom_bloc_observer.dart';
import 'package:potea_app/app/di/get_it_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  Bloc.observer = CustomBlocObserver();
  await setupGetit();

  runApp(const PoteaApp());
}
