import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giis_dmdk_app/bloc/auth_bloc/auth_bloc.dart';
// import 'package:giis_dmdk_app/bloc/company_bloc/company_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mtwin_1c_app/bloc/runinto1c_bloc/runinto1c_bloc.dart';

class MtWinDrawer extends StatelessWidget {
  const MtWinDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //  return BlocBuilder<AuthenticationBloc, AuthenticationState>(
    //      builder: (context, state) {
    //////var companyState = BlocProvider.of<CompanyBloc>(context).state;
    //  print('companyState=$companyState and Au-state = $state');
    // if ((state is AuthenticationGotAllTokens) &&
    //     (companyState is CompanyAllDmdkDictsSuccessfullyLoadedState)) {
    return SizedBox(
      width: 350,
      child: Drawer(
        child: SafeArea(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text("Отчёты в 1С"),
              selected: true,
              leading: SizedBox(
                width: 25,
                height: 25,
                child: SvgPicture.asset('assets/images/front_page.svg',
                    semanticsLabel: 'Acme Logo'),
              ),
              onTap: () {
                context.go("/run1ctasks");
                // context
                //     .read<RunInto1cBloc>()
                //     .add(const Got1CRunParameterEvent(run1CParam: 1));
              },
            ),
            const Divider(color: Colors.black12),
            ListTile(
              title: const Text("Перезаливка финансов"),
              selected: false,
              leading: SizedBox(
                width: 25,
                height: 25,
                child: SvgPicture.asset('assets/images/tree_green.svg',
                    semanticsLabel: 'Генерируем финансовые события ломбарда'),
              ),
              onTap: () {
                context.go("/rebuildfinance");
              },
            ),

            //   childrenPadding: const EdgeInsets.only(left: 60),
            //   children: [
            //     ListTile(
            //       //leading: const Icon(Icons.library_add_check_sharp),
            //       leading: SizedBox(
            //         width: 25,
            //         height: 25,
            //         child: SvgPicture.asset('assets/images/tree_green.svg',
            //             semanticsLabel: 'Acme Logo'),
            //       ),
            //       title: const Text('Открытия'),
            //       subtitle: const Text(' '),
            //       selected: true,
            //       onTap: () {
            //         context
            //             .read<RunInto1cBloc>()
            //             .add(const Got1CRunParameterEvent(run1CParam: 1));
            //       },
            //     ),
            //   ],

            // ExpansionTile(
            //   title: const Text("Закрытия"),
            //   leading: const Icon(Icons.settings_applications_sharp),
            //   childrenPadding: const EdgeInsets.only(left: 60),
            //   children: [
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Закрытия полной продажей"),
            //       subtitle: Text(' '),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Закрытия выкупом"),
            //       subtitle: const Text('заём закрывается самим заёмшиком '),
            //       onTap: () => context.go('/'),
            //     )
            //   ],
            // ),
            // ExpansionTile(
            //   title: const Text("Продажи частичные"),
            //   leading: const Icon(Icons.settings_applications_sharp),
            //   childrenPadding: const EdgeInsets.only(left: 60),
            //   children: [
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Для закрытых в этом периоде"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Для закрытых в этом периоде с убытком"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Для незакрытых в этом периоде"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //   ],
            // ),
            // ExpansionTile(
            //   title: const Text("Проценты по договорам"),
            //   leading: const Icon(Icons.settings_applications_sharp),
            //   childrenPadding: const EdgeInsets.only(left: 60),
            //   children: [
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и действует на конец периода"),
            //       subtitle: const Text('без частичного погашения'),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Открыт и закрыт в этом периоде заёмщиком"),
            //       subtitle: const Text('выкуп'),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text("Открыт и закрыт день в день"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт в этом периоде и действует на конец периода"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт в последний день периода и действует на конец периода"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и закрыт в этом периоде"),
            //       subtitle: const Text('выкуп'),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и закрыт полной продажей залога"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и закрыт частичной продажей вещей"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и действующий на конец периода с частичной продажей вещей"),
            //       subtitle: const Text(''),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода и частично погашен до этого периода"),
            //       subtitle: const Text(
            //           'сумма займа 0 на начало периода и долг только по %'),
            //       onTap: () => context.go('/'),
            //     ),
            //     ListTile(
            //       leading: const Icon(Icons.health_and_safety_sharp),
            //       title: const Text(
            //           "Открыт до этого периода, полностью погашен до этого периода, не закрыт на конец периода"),
            //       subtitle: const Text(
            //           'сумма займа 0, проценты 0, но на остатке вещь'),
            //       onTap: () => context.go('/'),
            //     ),
            //   ],
            // ),
          ],
        )),
      ),
    );

    //}
    // });
  }
}
