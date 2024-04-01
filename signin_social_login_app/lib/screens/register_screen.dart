import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:signin_social_login_app/authentication/auth.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:signin_social_login_app/screens/home_screen.dart';
import 'package:signin_social_login_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RegExp regex = new RegExp(r'^.{3,}$');
  var localAuth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _seeOrHidePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/purple-fluid.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Form(
              key: _key,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                // border: Border.all(color: Colors.black54)),
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Registration",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: usernameController,
                        autofocus: false,
                        onSaved: (value) {
                          usernameController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14, height: 1.2, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          labelText: "Username",
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 14),
                          prefixIconConstraints: BoxConstraints(minWidth: 40),
                          prefixIcon: Icon(
                              color: Colors.grey[700], Icons.person, size: 25),
                          hintText: "Enter the username",
                          hintStyle:
                              TextStyle(color: Colors.white60, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Username is required..");
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: usernameController,
                        autofocus: false,
                        onSaved: (value) {
                          usernameController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14, height: 1.2, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 14),
                          prefixIconConstraints: BoxConstraints(minWidth: 40),
                          prefixIcon: Icon(
                              color: Colors.grey[700], Icons.email, size: 25),
                          hintText: "Enter the email",
                          hintStyle:
                              TextStyle(color: Colors.white60, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Email is required..");
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                        autofocus: false,
                        onSaved: (value) {
                          passwordController.text = value!;
                          FocusScope.of(context).unfocus();
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14, height: 1.2, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 14),
                          prefixIconConstraints: BoxConstraints(minWidth: 40),
                          prefixIcon: Icon(
                              color: Colors.grey[700], Icons.lock, size: 25),
                          suffixIcon: IconButton(
                            color: Colors.grey[700],
                            onPressed: _seeOrHidePassword,
                            icon: Icon(
                                _obscureText == true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 25),
                          ),
                          hintText: "Enter the password",
                          hintStyle:
                              TextStyle(color: Colors.white60, fontSize: 12),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Password is required..");
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ElevatedButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black.withOpacity(0.7)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 55),
                            )),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SocialLoginButton(
                        borderRadius: 50,
                        width: MediaQuery.of(context).size.width,
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () async {
                          var result =
                              await AuthenticationMethods().signInWithGoogle();

                          if (result.user != null) {
                            print(
                                "login success >> ${result.user!.email} , ${result.user!.displayName} , ${result.user!.uid}");
                            print(
                                "login success >> ${result.user!.photoURL} , ${result.additionalUserInfo!.providerId}");

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(
                                  gmail: result.user!.email!,
                                  username: result.user!.displayName!,
                                  photoUrl: result.user!.photoURL!,
                                ),
                              ),
                            );
                          } else {
                            const snackBar = SnackBar(
                              content: Text("Error while login with Google!!"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Do you already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
