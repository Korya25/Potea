// lib/app/di/get_it_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:potea_app/core/services/firebase/firebase_options.dart';
import 'package:potea_app/core/services/network/network_services.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:potea_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:potea_app/features/auth/data/repo/auth_repo.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/home/data/datasource/product_remote_data_source.dart';
import 'package:potea_app/features/home/data/repo/product_repository.dart';
import 'package:potea_app/features/home/presentation/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // 🔹 Shared Preferences (Async)
  getIt.registerSingletonAsync<Prefs>(() async {
    return await Prefs.init();
  });

  // 🔹 Dio Setup
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
    if (!kIsWeb) dio.options.sendTimeout = const Duration(seconds: 10);
    return dio;
  });

  // 🔹 Network Service
  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(dio: getIt<Dio>()),
  );

  // 🔹 Firebase Initialization (Async)
  getIt.registerSingletonAsync<FirebaseApp>(
    () async => await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  );

  // 🔹 FirebaseAuth + Firestore (Async - wait for FirebaseApp)
  getIt.registerSingletonAsync<FirebaseAuth>(() async {
    await getIt.isReady<FirebaseApp>();
    return FirebaseAuth.instance;
  });

  getIt.registerSingletonAsync<FirebaseFirestore>(() async {
    await getIt.isReady<FirebaseApp>();
    return FirebaseFirestore.instance;
  });

  // 🔹 Auth Layer
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(prefs: getIt<Prefs>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
      networkService: getIt<NetworkService>(),
      firebaseAuth: getIt<FirebaseAuth>(),
    ),
  );

  getIt.registerFactory(() => AuthCubit(repository: getIt<AuthRepository>()));

  // 🔹 Product Layer
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(remoteDataSource: getIt<ProductRemoteDataSource>()),
  );

  getIt.registerFactory(() => ProductCubit(getIt<ProductRepository>()));

  // ✅ Wait for all async singletons
  await getIt.allReady();
}
