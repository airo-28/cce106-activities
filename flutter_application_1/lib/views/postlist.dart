import 'package:flutter/material.dart';

import 'profile.view.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final UserData userdata;
  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  Future<void> gotoPage(BuildContext context, dynamic page) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    if (!mounted) return;
    setState(() {});
  }

  Widget buttons(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPost.isliked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isliked = (userPost.isliked) ? false : true;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ), // TextButton.icon
      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {
          gotoPage(
            context,
            ProfileView(userPost: userPost, userData: widget.userdata),
          );
        },
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ), // TextButton.icon

      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ), // TextButton.icon
    ],
  ); // Row

  Widget postCount(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.numcomments} Comments'),
      const Text(''),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  ); // Row

  Widget postImage(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill,
        ), // DecorationImage
      ), // BoxDecoration
    ), // Container
  ); // Padding

  Widget postHeader(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ), // CircleAvatar
      ), // Container
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text('${userPost.time} · '),
              const Icon(Icons.people, size: 18),
            ],
          ), // Row
        ],
      ), // Column
    ],
  ); // Row

  Widget showPost(Userpost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(children: [Text(userPost.postcontent, style: nametxtStyle)]),
      ), // Container
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15),
    ],
  ); // Column

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.userdata.userList.map((userPost) {
        return InkWell(
          onTap: () {
            gotoPage(
              context,
              ProfileView(userPost: userPost, userData: widget.userdata),
            );
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}
