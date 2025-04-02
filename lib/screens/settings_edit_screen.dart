import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/entities/app_config.dart';
import 'package:mtwin_1c_app/main_components/app_bar/app_bar_new.dart';
import 'package:mtwin_1c_app/screens/helpers/inline_envi.dart';

class SettingsEditScreen extends StatelessWidget {
  SettingsEditScreen({super.key});

  TextEditingController envCtrl = TextEditingController();
  TextEditingController analyticsDebugCtrl = TextEditingController();
  TextEditingController analyticsDevCtrl = TextEditingController();
  TextEditingController analyticsProdCtrl = TextEditingController();
  TextEditingController ticketDebugCtrl = TextEditingController();
  TextEditingController ticketDevCtrl = TextEditingController();
  TextEditingController ticketProdCtrl = TextEditingController();
  TextEditingController ticketObjectDebugCtrl = TextEditingController();
  TextEditingController ticketObjectDevCtrl = TextEditingController();
  TextEditingController ticketObjectProdCtrl = TextEditingController();

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    var cfg = context.read<AuthenticationBloc>().cfg;
    envCtrl.text = cfg == null ? "n/a" : cfg.currentEnvironment;

    analyticsDebugCtrl.text = cfg == null ? "n/a" : cfg.analyticsDebugCtrl;
    analyticsDevCtrl.text = cfg == null ? "n/a" : cfg.analyticsDevCtrl;
    analyticsProdCtrl.text = cfg == null ? "n/a" : cfg.analyticsProdCtrl;

    ticketDebugCtrl.text = cfg == null ? "n/a" : cfg.ticketDebugCtrl;
    ticketDevCtrl.text = cfg == null ? "n/a" : cfg.ticketDevCtrl;
    ticketProdCtrl.text = cfg == null ? "n/a" : cfg.ticketProdCtrl;

    ticketObjectDebugCtrl.text =
        cfg == null ? "n/a" : cfg.ticketObjectDebugCtrl;
    ticketObjectDevCtrl.text = cfg == null ? "n/a" : cfg.ticketObjectDevCtrl;
    ticketObjectProdCtrl.text = cfg == null ? "n/a" : cfg.ticketObjectProdCtrl;

    return Scaffold(
      appBar: CustomAppBar(title: 'MtWin - 1C'),
      body: Center(
        child: SizedBox(
          width: 700,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextFormField(
                    //   controller: envCtrl,
                    //   decoration: const InputDecoration(
                    //       labelText: 'Рабочая среда:'),
                    // ),
                    const InlineEnvi(),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: analyticsDebugCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Аналитика, debug:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: analyticsDevCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Аналитика, dev:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: analyticsProdCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Аналитика, prod:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketDebugCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket, debug:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketDevCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket, dev:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketProdCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket, prod:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketObjectDebugCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket object, debug:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketObjectDevCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket object, dev:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ticketObjectProdCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Ticket object, prod:',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go("/");
                          },
                          tooltip: 'Выйти без сохранения',
                          icon: const Icon(Icons.cancel),
                          hoverColor: Colors.red[200],
                          iconSize: 30,
                          color: Colors.black38,
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            AppConfig appCfg = AppConfig(
                              currentEnvironment: "",
                              analyticsDebugCtrl: analyticsDebugCtrl.text,
                              analyticsDevCtrl: analyticsDevCtrl.text,
                              analyticsProdCtrl: analyticsProdCtrl.text,
                              ticketDebugCtrl: ticketDebugCtrl.text,
                              ticketDevCtrl: ticketDevCtrl.text,
                              ticketProdCtrl: ticketProdCtrl.text,
                              ticketObjectDebugCtrl: ticketObjectDebugCtrl.text,
                              ticketObjectDevCtrl: ticketObjectDevCtrl.text,
                              ticketObjectProdCtrl: ticketObjectProdCtrl.text,
                            );
                            context.read<AuthenticationBloc>().add(
                              SetEnvironmentVarEvent(
                                config: appCfg,
                                wasEdited: true,
                              ),
                            );

                            context.go("/");
                          },
                          tooltip: 'Сохранить изменения',
                          icon: const Icon(Icons.save),
                          hoverColor: Colors.green[200],
                          iconSize: 30,
                          color: Colors.green[600],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
