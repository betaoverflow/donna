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
          const SizedBox(height: 40),
          buildAbout(user),
          const SizedBox(height: 40),
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
          const SizedBox(height: 15),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                backgroundColor: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => {},
              icon: Icon(
                Icons.email_outlined,
                color: Colors.green,
              ),
              label: Text(
                user.email,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                backgroundColor: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => {},
              icon: Icon(
                Icons.phone_outlined,
                color: Colors.green,
              ),
              label: Text(
                user.mobile,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                backgroundColor: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => {},
              icon: Icon(
                Icons.home_outlined,
                color: Colors.green,
              ),
              label: Text(
                user.address,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
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
