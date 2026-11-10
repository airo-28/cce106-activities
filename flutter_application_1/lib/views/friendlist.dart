import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/friend.dart';

import '../model/userdata.dart';

class Friendlist extends StatelessWidget {
  const Friendlist({super.key, required this.userdata});

  final UserData userdata;

  final followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            friend.img,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(friend.name)),
      ],
    ),
  );

  Widget friendListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 180,
    ),

    itemCount: userdata.friendList.length,
    itemBuilder: (BuildContext ctx, index) {
      return friend(userdata.friendList[index]);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text("Friends", style: followTxtStyle)]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('${userdata.friendList.length} Friends')]),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 380, child: friendListGrid()),
        SizedBox(height: 10, child: Container(color: Colors.grey)),
      ],
    );
  }
}
