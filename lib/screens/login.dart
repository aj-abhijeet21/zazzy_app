import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zazzy_app/blocs/weather_bloc.dart';
import 'package:zazzy_app/blocs/weather_event.dart';
import 'package:zazzy_app/blocs/weather_state.dart';
import 'package:zazzy_app/services/auth_service.dart';
import 'package:zazzy_app/services/utils.dart';
import 'package:zazzy_app/widgets/gradient_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo.jpg',
                  ),
                  radius: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: darkOrange,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkOrange,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18,
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(20.0),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: darkOrange,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkOrange,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password == null && password!.length < 6
                          ? 'Enter min. 6 characters'
                          : null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18,
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(20.0),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<WeatherBloc, WeatherState>(
                          builder: (context, state) {
                        return GradientButton(
                          onClick: () async {
                            var loginSuccess = await authService.login(
                              formKey: formKey,
                              username: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            print(loginSuccess);

                            if (loginSuccess == true) {
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(LoginSuccessEvent());
                            } else {
                              Utils.showSnackBar('Login Failed');
                            }
                          },
                          title: 'Login',
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
