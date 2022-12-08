import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/common/widgets/text_input.dart';
import 'package:flutter/material.dart';

//Radio button values
enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup; //State //radio input val with default value
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  //I used same email&pass controllers for signin and signup so if user write email or pass in signup form and switched to login his/her data will also be shown there
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  //Clean memory
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  //calling internal function to send http request to server
  void signUpUser(){
    //no need to use BuildContext as param because we are in StatefulWidt
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    //--------------
    //START OF FORMS
    final signUpForm = Column(
      children: [
        CustomTextField(
          controller: _nameController,
          textPlaceholder: 'Name',
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _emailController,
          textPlaceholder: 'Email',
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _passwordController,
          textPlaceholder: 'Password',
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: 'signup',
          handlePress: () => signUpUser(),
        ),
      ],
    );
    final signInForm = Column(
      children: [
        const SizedBox(height: 10),
        CustomTextField(
          controller: _emailController,
          textPlaceholder: 'Email',
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _passwordController,
          textPlaceholder: 'Password',
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: 'login',
          handlePress: () {},
        ),
      ],
    );
    //END OF FORMS
    //--------------

    //------------
    //MAIN RENDER
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Welcome',
                  style: TextStyle(
                    fontSize: GlobalVariables.textXL,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 20),

              //-------------------
              //START SIGNUP LOGIC
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: signUpForm,
                  ),
                ),
              //END SIGNUP LOGIC
              //----------------

              //-------------------
              //START LOGIN LOGIC
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Sign-in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: signInForm,
                  ),
                ),
              //END LOGIN LOGIC
              //-----------------
            ],
          ),
        ),
      ),
    );
  }
}
