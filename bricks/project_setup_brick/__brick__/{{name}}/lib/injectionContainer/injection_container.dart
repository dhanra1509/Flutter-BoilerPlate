import 'package:get_it/get_it.dart';
import 'package:{{name}}/bloc/authentication/authentication_bloc.dart';
import 'package:{{name}}/repositories/auth_repository.dart';
import 'package:{{name}}/repositories/auth_repository_impl.dart';
import 'package:{{name}}/repositories/user_repository.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator
    ..registerFactory(
        () => AuthenticationBloc(serviceLocator.call(), serviceLocator.call()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl())
    ..registerLazySingleton<UserRepository>(() => UserRepository());
}
