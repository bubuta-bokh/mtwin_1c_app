import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
//import 'package:logger/logger.dart';
import 'package:mtwin_1c_app/entities/auth_maths/auth_credentials.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';

import '../../repositories/auth_repository.dart';
import '../../entities/user_credentials.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );
  String? envi;
  AppConfig? cfg;

  AuthenticationBloc({required this.authRepository})
    : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      //logger.i('AppStarted event fired');
      final bool hasToken = authRepository.hasToken;
      //logger.i('hasToken=$hasToken');
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<GetEnvironmentVarEvent>((event, emit) {
      cfg = event.config;
      envi = cfg!.currentEnvironment;
      authRepository.setAppConfig(cfg!);
    });

    on<SetEnvironmentVarEvent>((event, emit) {
      if (cfg != null) {
        authRepository.updateConfigFile(event.config, envi!);
      }
      emit(AuthenticationGotAllTokens(authRepository.userCreds!));
      SnackbarGlobal.show(
        'Конфигурация программы была изменена! Изменения были сохранены в файле.',
        10,
        'success',
      );
      // // // // Timer(Duration(seconds: 20), () {
      // // // //   exit(0);
      // // // // });

      cfg = event.config;
      //envi = cfg!.currentEnvironment;
    });

    on<SetEnviEvent>((event, emit) {
      envi = event.envi;
      print('[From auth_bloc] line 59 $envi');
      emit(AuthenticationGotAllTokens(authRepository.userCreds!));
      SnackbarGlobal.show(
        'Конфигурация программы была изменена. Необходимо сохранить изменения, кнопка внизу экрана!',
        10,
        'success',
      );
    });

    on<LoginButtonPressed>((event, emit) async {
      print('[From auth_bloc] L50');
      emit(AuthenticationLoading());
      print('[From auth_bloc] L52');
      await authRepository.getGraphTokens();
      print('[From auth_bloc] L54');
      if (authRepository.hasToken) {
        //emit(AuthenticationAuthenticated());
        print('[From auth_bloc] L57');
        await authRepository.getUserCredentials();
        print('[From auth_bloc] L59');
        if (authRepository.hasUserCreds) {
          //emit(AuthenticationGotUserCreds(authRepository.userCreds!));
          //logger.i('companyScope=${AuthCredentials.scopes["company"]}');
          print('[From auth_bloc] L63');
          await authRepository.getMtWinTokenStuff(
            'https://www.mtwin.ru/MtWin.Services.CompanyService/user_impersonation',
          );
          print('[From auth_bloc] L66');
          //logger.i('company done');
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["ticket"],
          );
          print('[From auth_bloc] L70');
          //logger.i('ticket done');
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["customer"],
          );
          print('[From auth_bloc] L74');
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["analytics"],
          );
          print('[From auth_bloc] L77');
          //logger.i('customer done - all done');
          emit(AuthenticationGotAllTokens(authRepository.userCreds!));
        }
      }
    });

    on<DoLogOut>((event, emit) async {
      emit(AuthenticationLoading());
      await authRepository.doLogout();
      emit(AuthenticationUnauthenticated());
    });
  }
}
