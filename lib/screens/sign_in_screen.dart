import 'package:blocformdemo/screens/bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return displayLoginScreen(context);
  }

  Widget displayLoginScreen(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: 10),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'SignIn Demo Form Validation',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    (state is SignInErrorState)
                        ? Text(state.errorMessage,
                            style: const TextStyle(color: Colors.red))
                        : Container(),
                    // : Container(),

                    // }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInTextChangedEvent(
                                emailController.text, passwordController.text));
                      },
                      decoration:
                          const InputDecoration(hintText: 'Email Address'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      onChanged: (value) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInTextChangedEvent(
                                emailController.text, passwordController.text));
                      },
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // displayLoginOption(),

                    state is SignInLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CupertinoButton(
                            borderRadius: BorderRadius.circular(12),
                            color: state is SignInValidState
                                ? Colors.blue
                                : Colors.grey,
                            disabledColor: Colors.grey,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () async {
                              if (state is SignInValidState) {
                                BlocProvider.of<SignInBloc>(context).add(
                                    SignInSubmitEvent(emailController.text,
                                        passwordController.text));
                              }
                            }),
                    const SizedBox(height: 20.0),
                  ],
                );
              },
            ),
          ),
        ), //  ),
        // ),
      ),
    );
  }
}
