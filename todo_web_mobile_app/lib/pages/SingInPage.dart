import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_web_mobile_app/pages/HomePage.dart';
import 'SingUpPage.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Регистрация',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              buttonItem(
                  'assets/goolge.svg', 'C помощью Google сервисов', 25.0),
              SizedBox(
                height: 15,
              ),
              buttonItem('assets/phone.svg', 'C помощью номер телефона', 25.0),
              SizedBox(
                height: 15,
              ),
              Text('ИЛИ'),
              SizedBox(
                height: 15,
              ),
              textItem('Ваш Email', _emailController, false),
              SizedBox(
                height: 15,
              ),
              textItem('Ваш Пароль', _passController, true),
              SizedBox(
                height: 20,
              ),
              buttonColor(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Есть аккаунт?',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => SingUpPage()),
                          (route) => false);
                    },
                    child: Text(
                      'Войти',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget buttonItem(String imagepath, String buttonName, double size) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        // color: Colors.amberAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.grey)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            imagepath,
            width: size,
            height: size,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            buttonName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ]),
      ),
    );
  }

  Widget textItem(
      String labelText, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 15),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 17, color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 1,
                color: Colors.yellow,
              )),
        ),
      ),
    );
  }

  Widget buttonColor() {
    return InkWell(
      onTap: () async {
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: _emailController.text, password: _passController.text);
          print(userCredential.user?.email);
          setState(() {
            circular = true;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        child: circular
            ? CircularProgressIndicator()
            : Text(
                'Зарегестрироваться',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        width: MediaQuery.of(context).size.width - 90,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 9, 220, 199), Colors.teal])),
      ),
    );
  }
}


// MissingPluginException (Исключение MissingPluginException(не
//  найдена реализация для метода
//  чтения по каналу plugins.it_nomads.com/flutter_secure_storage ))