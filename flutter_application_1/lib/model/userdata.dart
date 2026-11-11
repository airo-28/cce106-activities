import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class UserData {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/images/user1.png',
      username: 'John Doe',
      time: '2 hours ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post1.png',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
    Userpost(
      userimg: 'assets/images/user2.png',
      username: 'Jane Smith',
      time: '1 hour ago',
      postcontent: 'Another sample post content.',
      postimg: 'assets/images/post2.png',
      numcomments: '20',
      numshare: '8',
      isliked: true,
    ),
    Userpost(
      userimg: 'assets/images/user3.png',
      username: 'Alice Johnson',
      time: '2 hours ago',
      postcontent: 'This is the third sample content.',
      postimg: 'assets/images/post3.png',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
    Userpost(
      userimg: 'assets/images/user4.png',
      username: 'Bob Brown',
      time: '2 hours ago',
      postcontent: 'This is the fourth.',
      postimg: 'assets/images/post4.png',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/images/user3.png', name: 'Alice'),
    Friend(img: 'assets/images/user4.png', name: 'Bob'),
    Friend(img: 'assets/images/user1.png', name: 'Charlie'),
    Friend(img: 'assets/images/user2.png', name: 'Diana'),
    Friend(img: 'assets/images/user5.png', name: 'Ethan'),
    Friend(img: 'assets/images/user6.png', name: 'Fiona'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/images/user1.png',
      commenterName: 'Alice',
      commentTime: '2 hours ago',
      commentContent: 'Looks Fun!',
    ),

    Usercomment(
      commenterImg: 'assets/images/user2.png',
      commenterName: 'Bob',
      commentTime: '1 hour ago',
      commentContent: 'Great post!',
    ),

    Usercomment(
      commenterImg: 'assets/images/user3.png',
      commenterName: 'Charlie',
      commentTime: '30 minutes ago',
      commentContent: 'Nice picture!',
    ),
  ];

  Account myAccount = Account(
    name: 'Airo S. Parondo',
    email: 'airo.s.parondo@example.com',
    img: 'assets/images/profile.png',
    numFollowers: '150',
    numPosts: '25',
    numFollowing: '100',
    numFriends: '50',
  );
}
