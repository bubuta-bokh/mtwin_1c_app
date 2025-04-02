import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';

class InlineEnvi extends StatefulWidget {
  const InlineEnvi({super.key});

  @override
  State<InlineEnvi> createState() => _InlineEnviState();
}

class _InlineEnviState extends State<InlineEnvi> {
  final List<String> items = ['DEBUG', 'DEV', 'PROD'];
  String? selectedItem;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero).then((value) {
  //     if (mounted) {
  //       selectedItem = context.read<AuthenticationBloc>().cfg == null
  //           ? 'DEBUG'
  //           : context.read<AuthenticationBloc>().cfg?.currentEnvironment;
  //     }
  //     print('SelectedItem=$selectedItem');
  //   });
  // }

  @override
  void didChangeDependencies() {
    //print("didChangeDependencies");
    //columns = getColumnsForDetectCirculationTicketsTable(context);
    selectedItem =
        context.read<AuthenticationBloc>().envi == null
            ? 'DEBUG'
            : context.read<AuthenticationBloc>().envi!;
    //print("L36 - did change");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // selectedItem = context.read<AuthenticationBloc>().cfg == null
    //     ? 'Debug'
    //     : context.read<AuthenticationBloc>().cfg?.currentEnvironment;
    print('Selected item in L45=$selectedItem');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
          items.map((String item) {
            return Row(
              children: [
                Radio<String>(
                  value: item,
                  groupValue: selectedItem,
                  onChanged: (String? value) {
                    setState(() {
                      print('Selected item in L58=${value!}');
                      selectedItem = value!;
                      context.read<AuthenticationBloc>().add(
                        SetEnviEvent(envi: value!, wasEdited: true),
                      );
                    });
                  },
                ),
                Text(item),
              ],
            );
          }).toList(),
    );
  }
}
