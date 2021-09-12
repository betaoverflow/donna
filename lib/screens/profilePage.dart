import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donna/model/user.dart';
import 'package:donna/utils/userPreferences.dart';
import 'package:donna/widgets/appbar.dart';
import 'package:donna/widgets/button.dart';
import 'package:donna/widgets/profile.dart';
import 'package:donna/screens/editProfilePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            //   onClicked: () {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 50),
          buildAbout(user),
          const SizedBox(height: 50),
          Center(child: buildUserButton()),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade50,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
            ),
            onPressed: () {},
            child: Text(
              user.email,
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade50,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
            ),
            onPressed: () {},
            child: Text(
              user.mobile,
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade50,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
            ),
            onPressed: () {},
            child: Text(
              user.address,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );

  Widget buildUserButton() => ButtonWidget(
        text: 'EDIT',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
