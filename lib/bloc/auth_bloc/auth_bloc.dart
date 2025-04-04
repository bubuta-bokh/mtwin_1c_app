import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/entities/auth_maths/auth_credentials.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';

import '../../repositories/auth_repository.dart';
import '../../entities/user_credentials.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  String? envi;
  AppConfig? cfg;

  AuthenticationBloc({required this.authRepository})
    : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = authRepository.hasToken;
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
      emit(AuthenticationGotAllTokens(authRepository.userCreds!));
      SnackbarGlobal.show(
        'Конфигурация программы была изменена. Необходимо сохранить изменения, кнопка внизу экрана!',
        10,
        'success',
      );
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      await authRepository.getGraphTokens();
      if (authRepository.hasToken) {
        await authRepository.getUserCredentials();
        if (authRepository.hasUserCreds) {
          await authRepository.getMtWinTokenStuff(
            'https://www.mtwin.ru/MtWin.Services.CompanyService/user_impersonation',
          );
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["ticket"],
          );
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["customer"],
          );
          await authRepository.getMtWinTokenStuff(
            AuthCredentials.scopes["analytics"],
          );
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
