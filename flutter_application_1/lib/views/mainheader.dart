import 'package:flutter/material.dart';

import '../model/userdata.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key, required this.userdata});

  final UserData userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userdata.myAccount.img),
          radius: 40,
        ),
        Text(
          userdata.myAccount.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(userdata.myAccount.email),
      ],
    );
  }
}
