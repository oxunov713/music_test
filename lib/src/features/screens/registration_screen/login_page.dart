import 'package:flutter/material.dart';


import '../../../common/styles/app_colors.dart';
import '../../../common/styles/app_icons.dart';
import '../../../common/tools/fonts.dart';
import 'widgets/custom_inkwell.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isVisible = true;
  bool isSigning = false;
  String? isEnable;
  String? isEnablePassword;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.loginBackground,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontFamily: FontFamily.Jost.fFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: "\nDõppi Music",
                            style: TextStyle(
                              fontFamily: FontFamily.Jost.fFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 45,
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 40, right: 20, bottom: 12),
                  child: TextField(
                    controller: _email,
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFFBC0063),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      errorText: isEnable,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFFBC0063),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(217, 217, 217, 0.5),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      fillColor: const Color.fromRGBO(217, 217, 217, 0.5),
                      filled: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.email,
                          size: 20,
                        ),
                      ),
                      hintText: "  Email",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.Montserrat.fFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 13,
                    right: 20,
                  ),
                  child: TextField(
                    controller: _password,
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBC0063),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      errorText: isEnablePassword,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFFBC0063),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(217, 217, 217, 0.5),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: (!isVisible)
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(
                                Icons.visibility,
                              ),
                      ),
                      fillColor: const Color.fromRGBO(217, 217, 217, 0.5),
                      filled: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.lock,
                          size: 20,
                        ),
                      ),
                      hintText: "  Password",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.Montserrat.fFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    obscuringCharacter: "*",
                    obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFBC0063),
                      shadowColor: Colors.black,
                      disabledBackgroundColor: Colors.grey,
                      shape: const StadiumBorder(),
                      fixedSize: const Size(300, 50),
                    ),
                    child: isSigning
                        ? const CircularProgressIndicator()
                        : Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: FontFamily.Jost.fFamily,
                            ),
                          ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot the password?",
                      style: TextStyle(
                          color: Color(0xFFBC0063),
                          fontFamily: FontFamily.Jost.fFamily,
                          fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          endIndent: 5,
                          indent: 20,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: FontFamily.Jost.fFamily,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          endIndent: 20,
                          indent: 5,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomInkwell(svgPicture: AppIcons.googleIc),
                        CustomInkwell(svgPicture: AppIcons.facebookIc),
                        CustomInkwell(svgPicture: AppIcons.appleIc),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: FontFamily.Montserrat.fFamily,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/signup"),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: FontFamily.Montserrat.fFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFBC0063),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
