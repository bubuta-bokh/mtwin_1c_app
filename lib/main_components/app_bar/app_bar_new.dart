import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_with_all_tokens.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_without_tokens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  String _envi = 'n/a';

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final astate = context.watch<AuthenticationBloc>().state;

        _envi =
            context.read<AuthenticationBloc>().envi == null
                ? 'n/a'
                : context.read<AuthenticationBloc>().envi!;
        print('[From app_bar] envi=$_envi and astate = $astate');

        if (astate is AuthenticationGotAllTokens) {
          context.read<TicketBloc>().add(
            TicketInitialEvent(envi: _envi, loadingStage: false),
          );
          context.read<AnalyticsBloc>().add(
            AnalyticsInitialEvent(envi: _envi, loadingStage: false),
          );
          return appBarWithAllTokens(_envi, astate.userCreds, context);
        } else if (astate is AuthenticationUninitialized ||
            astate is AuthenticationUnauthenticated) {
          return appBarWithoutTokens(_envi, context);
        } else {
          return AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.blue,
            elevation: 4.0,
            // Add any other AppBar properties or widgets as needed
          );
        }
      },
    );
  }

  @override
  //Size get preferredSize => Size.fromHeight(kToolbarHeight);
  Size get preferredSize => Size.fromHeight(70.0);
}
