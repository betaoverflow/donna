import 'package:donna/model/UserAuth.dart';
import 'package:flutter/material.dart';
import 'package:donna/home.dart';
import 'package:provider/provider.dart';
import 'package:donna/screens/authenticate.dart';
import 'package:donna/screens/db/addUser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    print(user);

    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
