import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
// import 'package:mtwin_1c_app/bloc/company_bloc/company_bloc.dart';
import 'package:mtwin_1c_app/bloc/customer_bloc/customer_bloc.dart';
// import 'package:mtwin_1c_app/bloc/dmdk_bloc/dmdk_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar_with_all_tokens.dart';
import 'package:mtwin_1c_app/components/main_components/app_bar/app_bar_without_tokens.dart';
//import 'package:logger/logger.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class MtWinAppBar extends StatelessWidget implements PreferredSizeWidget {
  MtWinAppBar({super.key});
  // final logger = Logger(
  //   printer: PrettyPrinter(),
  // );

  String _envi = 'n/a';

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final astate = context.watch<AuthenticationBloc>().state;
      //final cstate = context.watch<CompanyBloc>().state;
      // final dstate = context.watch<DmdkBloc>().state;

      _envi = context.read<AuthenticationBloc>().envi;

      //print('Inside app_bar L29 astate = $astate, cstate=$cstate');
      if (astate is AuthenticationGotAllTokens
          //&&  cstate is! CompanyAllDmdkDictsSuccessfullyLoadedState
          ) {
        // context
        //     .read<CompanyBloc>()
        //     .add(RequestToGetDmdkDictionariesEvent(envi: _envi));
        context.read<TicketBloc>().add(TicketInitialEvent(envi: _envi));
        context.read<AnalyticsBloc>().add(AnalyticsInitialEvent(envi: _envi));
        context.read<CustomerBloc>().add(CustomerInitialEvent(envi: _envi));
        return PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: appBarWithAllTokens(_envi, astate.userCreds),
        );
      }
      // if (dstate is DmdkConfigValuesWereSetState &&
      //     astate is AuthenticationGotAllTokens) {
      //   var stunnelPort = context.read<DmdkBloc>().stunnelPort;
      //   var contour =
      //       stunnelPort == '1501' ? 'Рабочий контур' : 'Тестовый контур';
      //   return PreferredSize(
      //     preferredSize: const Size.fromHeight(70.0),
      //     child: appBarWithAllTokens(_envi, astate.userCreds, contour),
      //   );
      // }
      //if (astate is AuthenticationGotAllTokens &&
      //    cstate is CompanyAllDmdkDictsSuccessfullyLoadedState) {
      // print('Inside app_bar L39 astate = $astate, cstate=$cstate');

      // }
      else if (astate is AuthenticationUninitialized ||
          astate is AuthenticationUnauthenticated) {
        return PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: appBarWithoutTokens(_envi, context));
      } else {
        return PreferredSize(
            preferredSize: const Size.fromHeight(70.0), child: AppBar());
      }
      //return SizedBox.shrink();
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
