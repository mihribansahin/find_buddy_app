import 'package:flutter/material.dart';
import 'package:flutter_buddy_app/product/ui_helper/ui_helper.dart';
import 'package:flutter_buddy_app/product/utils/form_validator.dart';
import 'package:flutter_buddy_app/product/widget/appbar/login_register_appbar.dart';
import 'package:flutter_buddy_app/product/widget/button/social_button.dart';
import 'package:flutter_buddy_app/product/widget/text_field.dart/custom_text_field.dart';
import '../../../product/widget/button/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _mailAdress = "", _password = "";

  bool? _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: LoginRegisterAppBar(appBarTitle: UiHelper.login),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                UiHelper.loginSubtitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
              socialLoginButtons(),
              const SizedBox(
                height: 40,
              ),
              loginTextFields(),
              loginButton(),
              createAccontTextButton(context)
            ],
          ),
        )),
      ),
    );
  }

  Row socialLoginButtons() {
    return Row(
      children: [
        Expanded(
          child: SocialButton(
            onPressed: () {},
            buttonIcon: Image.asset(
              'assets/images/ic_google.png',
              color: Colors.white,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: SocialButton(
          onPressed: () {},
          buttonIcon: Image.asset(
            'assets/images/ic_instagram.png',
            color: Colors.white,
            height: 20,
          ),
        )),
      ],
    );
  }

  Column loginTextFields() {
    return Column(
      children: [
        MyTextFieldWidget(
          myLabel: "E-mail",
          onSubmitted: (val) {},
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          hintText: "example@email.com",
          obscureText: false,
          requiredText: UiHelper.emailRequiredText,
          title: '',
        ),
        MyTextFieldWidget(
            myLabel: "Password",
            obscureText: !_passwordVisible!,
            onSubmitted: (val) {},
            onSaved: (value) => _password = value,
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
            requiredText: "requiredText",
            validator: (val) {
              return validatePassword(passwordController.text);
            },
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible! ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                size: 15,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible!;
                });
              },
            )),
      ],
    );
  }

  Widget createAccontTextButton(BuildContext context) {
    return InkWell(
      onTap: (() {
        print("register");
        /* Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => RegisterPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );*/
      }),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(10),
        child: RichText(
          text: const TextSpan(
            text: 'Hesabın yok mu?',
            style: TextStyle(color: Colors.white, fontSize: 12),
            children: <TextSpan>[
              TextSpan(
                  text: ' Kaydol',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Center loginButton() {
    return Center(
        child: MyButton(
      buttonText: UiHelper.login,
      onTapFunc: () {
        //   Future.delayed()
        print("login");
      },
    ));
  }
}
