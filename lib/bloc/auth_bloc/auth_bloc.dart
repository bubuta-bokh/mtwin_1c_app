import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:logger/logger.dart';
import 'package:mtwin_1c_app/entities/auth_maths/auth_credentials.dart';

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
  String envi = 'n/a';

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
      envi = event.envi;

      //emit(AuthenticationGotAllTokens(authRepository.userCreds!));
      // print('auth bloc L37!!! ');
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      await authRepository.getGraphTokens();
      if (authRepository.hasToken) {
        //emit(AuthenticationAuthenticated());
        await authRepository.getUserCredentials();

        if (authRepository.hasUserCreds) {
          //emit(AuthenticationGotUserCreds(authRepository.userCreds!));
          //logger.i('companyScope=${AuthCredentials.scopes["company"]}');
          await authRepository.getMtWinTokenStuff(
              'https://www.mtwin.ru/MtWin.Services.CompanyService/user_impersonation');
          //logger.i('company done');
          await authRepository
              .getMtWinTokenStuff(AuthCredentials.scopes["ticket"]);
          //logger.i('ticket done');
          await authRepository
              .getMtWinTokenStuff(AuthCredentials.scopes["customer"]);
          await authRepository
              .getMtWinTokenStuff(AuthCredentials.scopes["analytics"]);
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
