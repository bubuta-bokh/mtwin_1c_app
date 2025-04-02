import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';
import 'package:mtwin_1c_app/components/tasks_1c/execute_task.dart';
//////import 'package:mtwin_1c_app/components/tasks_1c/execute_task.dart';
import 'package:mtwin_1c_app/entities/my_logger.dart';
import 'package:mtwin_1c_app/entities/snackbar_global.dart';
import 'package:mtwin_1c_app/repositories/analytics_repository.dart';
import 'package:mtwin_1c_app/repositories/run1C_repository.dart';
import 'package:mtwin_1c_app/screens/finance_rebuild_screen.dart';
import 'package:mtwin_1c_app/screens/run_1c_screen.dart';
import 'package:mtwin_1c_app/screens/settings_edit_screen.dart';
////import 'package:mtwin_1c_app/screens/finance_rebuild_screen.dart';
////import 'package:mtwin_1c_app/screens/run_1c_screen.dart';
////import 'package:mtwin_1c_app/screens/settings_edit_screen.dart';
import 'bloc/calendar_bloc/calendar_bloc.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'screens/main_screen.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/repositories/auth_repository.dart';
import 'package:mtwin_1c_app/repositories/ticket_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtwin_1c_app/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:mtwin_1c_app/bloc/analytics_bloc/analytics_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  final config = await AppConfig.forEnvironment();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<Run1cRepository>(
          create: (context) => Run1cRepository(),
        ),
        RepositoryProvider<TicketRepository>(
          create:
              (context) => TicketRepository(
                RepositoryProvider.of<AuthRepository>(context),
              ),
        ),
        RepositoryProvider<AnalyticsRepository>(
          create:
              (context) => AnalyticsRepository(
                RepositoryProvider.of<AuthRepository>(context),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (ctx) {
              //logger.i('authService started');
              final authRepository = RepositoryProvider.of<AuthRepository>(ctx);
              return AuthenticationBloc(authRepository: authRepository)
                ..add(AppStarted());
            },
            lazy: false,
          ),
          BlocProvider<TicketBloc>(
            create: (ctx) {
              //logger.i('ticketService has started');
              final ticketRepository = RepositoryProvider.of<TicketRepository>(
                ctx,
              );
              return TicketBloc(ticketRepository: ticketRepository)..add(
                const TicketInitialEvent(envi: 'DEBUG', loadingStage: true),
              );
            },
            lazy: false,
          ),
          BlocProvider<AnalyticsBloc>(
            create: (ctx) {
              //logger.i('ticketService has started');
              final analyticsRepository =
                  RepositoryProvider.of<AnalyticsRepository>(ctx);
              return AnalyticsBloc(
                analyticsRepository: analyticsRepository,
              )..add(
                const AnalyticsInitialEvent(envi: 'DEBUG', loadingStage: true),
              );
            },
            lazy: false,
          ),
          BlocProvider<CalendarBloc>(
            create: (ctx) {
              return CalendarBloc()..add(CalendarInitialEvent());
            },
            lazy: false,
          ),
          BlocProvider<RunInto1cBloc>(
            create: (ctx) {
              final run1cRepository = RepositoryProvider.of<Run1cRepository>(
                ctx,
              );
              return RunInto1cBloc(run1cRepository: run1cRepository)
                ..add(RunInto1CInitialEvent());
            },
            lazy: false,
          ),
        ],
        child: MyApp(
          //authRepository: authRepository,
          config: config,
          logger: myLogger,

          //isarServiceRepository: isarServiceRepository,
        ),
      ),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
    ),
    GoRoute(
      path: '/run1ctasks',
      builder: (BuildContext context, GoRouterState state) {
        return const Run1cScreen();
      },
    ),
    GoRoute(
      path: '/rebuildfinance',
      builder: (BuildContext context, GoRouterState state) {
        return const FinanceRebuildScreen();
      },
    ),
    GoRoute(
      path: '/settingsedit',
      builder: (BuildContext context, GoRouterState state) {
        return SettingsEditScreen();
      },
    ),
    GoRoute(
      name: "executetask",
      path: '/executetask/:taskId',
      builder: (BuildContext context, GoRouterState state) {
        return ExecuteTask(taskId: state.pathParameters['taskId']);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  final AppConfig config;
  final Logger logger;
  const MyApp({super.key, required this.config, required this.logger});

  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthenticationBloc>().state is AuthenticationLoading) {
      context.read<AuthenticationBloc>().add(
        GetEnvironmentVarEvent(config: config),
      );
      context.read<AnalyticsBloc>().add(
        AnalyticsConfigReadyEvent(config: config),
      );
      context.read<TicketBloc>().add(TicketConfigReadyEvent(config: config));
    }

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ru', '')],
      scaffoldMessengerKey: SnackbarGlobal.key,
      theme: ThemeData(fontFamily: 'Rubik', primarySwatch: Colors.blueGrey),
    );
  }
}
