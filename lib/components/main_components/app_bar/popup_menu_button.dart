import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtwin_1c_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtwin_1c_app/entities/user_credentials.dart';

class MyPopupMenuButton extends StatelessWidget {
  final UserCredentials userCreds;
  const MyPopupMenuButton({super.key, required this.userCreds});

  _onMenuItemSelected(int value, BuildContext ctx) {
    if (value == 2) ctx.read<AuthenticationBloc>().add(DoLogOut());
  }

  Widget _getChild(int position, IconData? iconData, String mainTitle,
      String? subTitle, String? avatarLetters, String? mtwinOffice) {
    final subt = subTitle ?? '';
    final office = mtwinOffice ?? '';
    if (position == 1) {
      return (Container(
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  //Text(office),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 207, 77, 120),
                    radius: 35,
                    child: Text(
                      avatarLetters!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1.4),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Text(
                    mainTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.black,
                        letterSpacing: 1.7),
                  ),
                ),
                Text(subt,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black54,
                        letterSpacing: 1.2)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(office,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black87,
                          letterSpacing: 1.3)),
                ),
              ],
            )
          ],
        ),
      ));
    } else if (position == 2) {
      return (Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(iconData, color: Colors.teal),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(mainTitle),
          ),
        ],
      ));
    } else {
      return (const Row());
    }
  }

  PopupMenuEntry _buildPopupMenuItem(
      {required String mainTitle,
      String? avatarLetters,
      String? subTitle,
      IconData? iconData,
      required int position,
      String? mtwinOffice}) {
    return PopupMenuItem(
      value: position,
      child: _getChild(
          position, iconData, mainTitle, subTitle, avatarLetters, mtwinOffice),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lettr = '${userCreds.givenName[0]} ${userCreds.surname[0]}';
    final dispName = userCreds.displayName;
    return PopupMenuButton(
      onSelected: (value) {
        _onMenuItemSelected(value as int, context);
      },
      constraints: const BoxConstraints.expand(width: 400, height: 170),
      offset: const Offset(20, 60),
      icon: const Icon(
        Icons.verified_user_outlined,
        size: 35,
      ),
      elevation: 9,
      //shape: RoundedRectangleBorder{borderRadius: BorderRadius.circular(32.0)},
      itemBuilder: (ctx) => [
        _buildPopupMenuItem(
            mainTitle: dispName,
            subTitle: userCreds.email,
            avatarLetters: lettr,
            iconData: Icons.search,
            position: 1,
            mtwinOffice: userCreds.office),
        const PopupMenuDivider(),
        _buildPopupMenuItem(
            mainTitle: 'Выйти из аккаунта',
            iconData: Icons.logout_outlined,
            position: 2),
        //_buildPopupMenuItem('Copy', Icons.copy,3),
      ],
    );
  }
}
