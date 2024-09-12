import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_api/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Positioned(
        top: -112,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 17, 187, 22),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150)),
          ),
          width: MediaQuery.of(context).size.width,
          height: 350,
        ),
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome back!',
            style: GoogleFonts.robotoCondensed(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 55,
            ),
            radius: 50,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //passwors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                onTap: () {
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    userLogin(email.text.toString(), password.text.toString(),
                        context);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Faild must not be empty!"),
                          );
                        });
                  }
                },
                child: Container(
                  width: 130,
                  height: 55,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 187, 22),
                    borderRadius: BorderRadiusDirectional.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 7,
          ),
          Center(
            child: InkWell(
              child: Text(
                'Forget your password?',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not yet a member?",
                style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: Text(
                  'Sign up now',
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      )),
    ])));
  }
}
