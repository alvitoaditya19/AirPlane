import 'dart:async';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:airplane/ui/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GetStartedPage()));
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icon_plane.png'))),
          ),
          Text(
            'AIRPLANE',
            style: whiteTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
              letterSpacing: 10,
            ),
          )
        ],
      )),
    );
  }
}
