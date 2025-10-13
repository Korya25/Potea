import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:potea_app/core/services/network/network_services.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/core/services/firebase/firebase_options.dart';
import 'package:potea_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:potea_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:potea_app/features/auth/data/repo/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // Prefs initialization (Async)
  getIt.registerSingletonAsync<Prefs>(() async {
    return await Prefs.init();
  });

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    // Set default timeouts for better web compatibility
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    // Only set sendTimeout for non-web platforms
    if (!kIsWeb) {
      dio.options.sendTimeout = const Duration(seconds: 10);
    }
    return dio;
  });

  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(dio: getIt<Dio>()),
  );

  // Firebase initialization (Async)
  getIt.registerSingletonAsync<FirebaseApp>(
    () async => await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  );

  // FirebaseAuth (Async - depends on FirebaseApp)
  getIt.registerSingletonAsync<FirebaseAuth>(() async {
    await getIt.isReady<FirebaseApp>();
    return FirebaseAuth.instance;
  });
  getIt.registerSingletonAsync<FirebaseFirestore>(() async {
    await getIt.isReady<FirebaseApp>();
    return FirebaseFirestore.instance;
  });

  // Auth Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Auth Local Data Source
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(prefs: getIt<Prefs>()),
  );

  // Auth Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
      networkService: getIt<NetworkService>(),
      firebaseAuth: getIt<FirebaseAuth>(),
    ),
  );

  await getIt.allReady();
}
