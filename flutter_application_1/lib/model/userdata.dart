import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class UserData {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/images/user1.jpg',
      username: 'John Doe',
      time: '2 hours ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post1.jpg',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
    Userpost(
      userimg: 'assets/images/user2.jpg',
      username: 'Jane Smith',
      time: '1 hour ago',
      postcontent: 'Another sample post content.',
      postimg: 'assets/images/post2.jpg',
      numcomments: '20',
      numshare: '8',
      isliked: true,
    ),
    Userpost(
      userimg: 'assets/images/user1.jpg',
      username: 'Alice Johnson',
      time: '2 hours ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post1.jpg',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
    Userpost(
      userimg: 'assets/images/user1.jpg',
      username: 'Bob Brown',
      time: '2 hours ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post1.jpg',
      numcomments: '10',
      numshare: '5',
      isliked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/images/user1.jpg', name: 'Alice'),
    Friend(img: 'assets/images/user2.jpg', name: 'Bob'),
    Friend(img: 'assets/images/user3.jpg', name: 'Charlie'),
    Friend(img: 'assets/images/user4.jpg', name: 'Diana'),
    Friend(img: 'assets/images/user4.jpg', name: 'Ethan'),
    Friend(img: 'assets/images/user4.jpg', name: 'Fiona'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/images/user1.jpg',
      commenterName: 'Alice',
      commentTime: '2 hours ago',
      commentContent: 'Looks Fun!',
    ),

    Usercomment(
      commenterImg: 'assets/images/user2.jpg',
      commenterName: 'Bob',
      commentTime: '1 hour ago',
      commentContent: 'Great post!',
    ),

    Usercomment(
      commenterImg: 'assets/images/user3.jpg',
      commenterName: 'Charlie',
      commentTime: '30 minutes ago',
      commentContent: 'Nice picture!',
    ),
  ];

  Account myAccount = Account(
    name: 'Airo S. Parondo',
    email: 'airo.s.parondo@example.com',
    img: 'assets/images/user1.jpg',
    numFollowers: '150',
    numPosts: '25',
    numFollowing: '100',
    numFriends: '50',
  );
}
