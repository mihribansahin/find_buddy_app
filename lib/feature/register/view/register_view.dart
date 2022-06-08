import 'package:flutter/material.dart';
import 'package:flutter_buddy_app/feature/register/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

import '../../../product/ui_helper/routes_helper.dart';
import '../../../product/ui_helper/ui_helper.dart';
import '../../../product/utils/form_validator.dart';
import '../../../product/widget/appbar/login_register_appbar.dart';
import '../../../product/widget/button/custom_button.dart';
import '../../../product/widget/button/social_button.dart';
import '../../../product/widget/text_field.dart/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _registerViewModel = RegisterViewModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? userName,
      userSurname,
      userMail,
      userPhoneNumber,
      userPassword,
      userAgainPassword;

  TextEditingController passwordAgainController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _registerViewModel,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          appBar: LoginRegisterAppBar(appBarTitle: UiHelper.signUp),
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
                  UiHelper.registerSubtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                socialRegisterButtons(),
                const SizedBox(
                  height: 40,
                ),
                registerTextFields(),
                registerButton(context),
                loginTextButton(context)
              ],
            ),
          )),
        ),
      ),
    );
  }

  Row socialRegisterButtons() {
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

  Column registerTextFields() {
    return Column(
      children: [
        MyTextFieldWidget(
          myLabel: UiHelper.name,
          onSubmitted: (val) {},
          onChanged: (val) {
            userName = val;
            print("current user name: $userName");
          },
          controller: nameController,
          textInputType: TextInputType.name,
          hintText: "",
          obscureText: false,
          requiredText: "",
          title: '',
        ),
        MyTextFieldWidget(
          myLabel: UiHelper.surname,
          onChanged: (val) {
            userSurname = val;
            print("current user surname: $userSurname");
          },
          onSubmitted: (val) {},
          controller: surnameController,
          textInputType: TextInputType.text,
          requiredText: "",
          obscureText: false,
        ),
        MyTextFieldWidget(
          myLabel: UiHelper.mail,
          onSubmitted: (val) {},
          onChanged: (val) {
            userMail = val;
            print("current userMail: $userMail");
          },
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          hintText: "example@email.com",
          obscureText: false,
          requiredText: UiHelper.emailRequiredText,
          title: '',
        ),
        MyTextFieldWidget(
          myLabel: UiHelper.phoneNumber,
          onSubmitted: (val) {},
          controller: phoneController,
          onChanged: (val) {
            userPhoneNumber = val;
            print("current user phoneNumber: $userPhoneNumber");
          },
          inputFormatters: [maskFormatter],
          hintText: "+xx (xxx) xxx xx xx",
          obscureText: false,
          textInputType: TextInputType.phone,
          validator: (val) {
            return validatePhoneNumber(phoneController.text);
          },
        ),
        //TODO: Add dropdown menu for city
        MyTextFieldWidget(
          myLabel: UiHelper.password,
          obscureText: true,
          onChanged: (val) {
            userPassword = val;
            print("current userPassword: $userPassword");
          },
          onSubmitted: (val) {},
          controller: passwordController,
          textInputType: TextInputType.visiblePassword,
          validator: (val) {
            return validatePassword(passwordController.text);
          },
        ),
        MyTextFieldWidget(
            myLabel: UiHelper.passwordAgain,
            obscureText: true,
            onChanged: (val) {
              userAgainPassword = val;
              print("current AgainUserPassword: $userAgainPassword");
            },
            onSubmitted: (val) {},
            controller: passwordAgainController,
            textInputType: TextInputType.visiblePassword,
            validator: (val) {
              return validatePasswordAgain(
                  passwordController.text, passwordAgainController.text);
            }),
      ],
    );
  }

  Widget loginTextButton(BuildContext context) {
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
            text: 'Hesabın var mı?',
            style: TextStyle(color: Colors.white, fontSize: 12),
            children: <TextSpan>[
              TextSpan(
                  text: ' Giriş Yap',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Center registerButton(BuildContext context) {
    return Center(
        child: MyButton(
      buttonText: UiHelper.signUp,
      onTapFunc: () {
        //   Future.delayed()
        print("register button clicked.");

        print(
            "CURRENT USER INFO: username: $userName, userSurname: $userSurname, userMail:$userMail , userPhone: $userPhoneNumber, userPassword: $userPassword, againUserPassword: $userAgainPassword");
        Navigator.of(context).pushNamed(RoutesHelper.loginPage);
      },
    ));
  }
}
