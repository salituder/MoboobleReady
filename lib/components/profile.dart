import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../domain/user.dart';
import '../services/auth.dart';





class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {



    return ListView(
      padding: const EdgeInsets.all(16.0),

      children: <Widget>[
        Column(
          children: <Widget>[
            Card(
              color: Colors.black54,
              elevation: 10.0,
              child: SizedBox(
                height: 400.0,
                child: Row(
                children: <Profile>[

                ],
                ),
              ),
            ),

            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () =>  AuthService().logOut(),
                    child: const Text('Выйти из аккаунта',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                )
              ],
            ),
            const Text(
                'Нажав на данную кнопку вы выйдете из аккаунта. Вам будет необходимо войти снова!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.redAccent)
            ),
          ],
        ),

      ],
    );






  }
}

