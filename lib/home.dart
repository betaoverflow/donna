import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

// importing screens
import 'package:donna/screens/homePage.dart';
import 'package:donna/screens/formPage.dart';
import 'package:donna/screens/profilePage.dart';
import 'package:donna/services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/circularLogo.png"),
            )),
            SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                'Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfilePage()));
              },
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                'Form',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            TextButton(
              child: Text('Logout',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            SizedBox(height: 25),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Donna',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )),
            ))
          ],
        ),
      ),
      //according to index pages shown
      body: <Widget>[HomePage(), FormPage(), ProfilePage()][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.1,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green[400],
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.add_box,
                color: Colors.black,
              ),
              title: Text("Form")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text("Profile")),
        ],
      ),
    ));
  }
}
