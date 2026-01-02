import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/helpers/show_snack_bar.dart';
import 'package:her_elegance/screens/home_screen.dart';
import 'package:her_elegance/screens/register_screen.dart';
import 'package:her_elegance/widgets/custom_button.dart';
import 'package:her_elegance/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, this.email, this.password, this.userName});

  static String id = 'loginScreen';
  String? userName;
  String? email;
  String? password;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final userName = args?['username'] ?? 'User';

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(color: kPrimaryColor),
      child: Scaffold(
        backgroundColor: kPrimaryBgColor,
        body: Padding(
          padding: EdgeInsets.only(top: 60, bottom: 60, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kBorderRadius,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/images/img2.png',
                              height: 200,
                              cacheWidth: 300,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 40,
                                color: kTextColor,
                                fontFamily: kFontFamily,
                              ),
                            ),

                            SizedBox(height: 35),
                            CustomTextFormField(
                              suffixIcon: Icon(
                                Icons.email,
                                color: kPrimaryBgColor,
                              ),
                              obscureText: false,
                              hintText: 'Email',
                              onChange: (data) {
                                widget.email = data;
                              },
                            ),
                            SizedBox(height: 20),
                            CustomTextFormField(
                              suffixIcon: Icon(
                                Icons.password,
                                color: kPrimaryBgColor,
                              ),
                              obscureText: true,
                              hintText: 'Password',
                              onChange: (data) {
                                widget.password = data;
                              },
                            ),
                            SizedBox(height: 20),
                            CustomButtom(
                              text: 'Login',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    await loginUser();
                                    Navigator.pushNamed(
                                      context,
                                      HomeScreen.id,
                                      arguments: {
                                        'email': widget.email,
                                        'username': userName,
                                      },
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      showSnackBar(context, 'User not found');
                                    } else if (e.code == 'wrong-password') {
                                      showSnackBar(context, 'wrong-password');
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                      context,
                                      'There was an error ',
                                    );
                                  }
                                  isLoading = false;
                                  setState(() {});
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'dont\'t have an account?',
                                  style: TextStyle(color: kTextColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RegisterScreen.id,
                                    );
                                  },
                                  child: Text(
                                    ' Register',
                                    style: TextStyle(color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'HerElegance',
                  style: TextStyle(fontFamily: kFontFamily, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: widget.email!,
          password: widget.password!,
        );
  }
}
