import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/service/di/app_di.dart';
import 'package:flutter_tutorial/core/unions/ui_state/ui_state.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tutorial/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_button.dart';
import 'package:flutter_tutorial/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:flutter_tutorial/features/dashboard/presentation/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  final AuthenticationCubit authenticationCubit;
  const LoginPage({super.key, required this.authenticationCubit});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    authenticationCubit = widget.authenticationCubit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocProvider.value(
        value: authenticationCubit,
        child: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            UiState loginState = state.loginState;
            if (loginState is UiStateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(loginState.callException.message)));
            }
            if (loginState is UiStateSuccess) {
              //Navigate to next screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DasboardPage(),
                  ));
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    label: "Email",
                    textEditingController: emailController,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    label: "Password",
                    textEditingController: passwordController,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return CustomTextButton(
                        isLoading:
                            state.loginState is UiStateLoading ? true : false,
                        label: state.loginState is UiStateFailure
                            ? "Retry"
                            : "Login",
                        onTap: () async {
                          await context.read<AuthenticationCubit>().login(
                                loginParams: LoginParams(
                                  username: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                      );

                      // Uncomment for returning UI based on state.
                      // return state.loginState.when(
                      //   initial: () => CustomTextButton(
                      //     isLoading: false,
                      //     label: "Login",
                      //     onTap: () {
                      // widget.authenticationCubit.login(
                      //   loginParams: LoginParams(
                      //     username: emailController.text,
                      //     password: passwordController.text,
                      //   ),
                      // );
                      //     },
                      //   ),
                      //   laoding: () => CustomTextButton(
                      //     isLoading: true,
                      //     label: "Login",
                      //     onTap: () {},
                      //   ),
                      //   failure: (e) => CustomTextButton(
                      //     isLoading: false,
                      //     label: "Retry",
                      //     onTap: () {
                      //       widget.authenticationCubit.login(
                      //         loginParams: LoginParams(
                      //           username: emailController.text,
                      //           password: passwordController.text,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      //   success: (v) => SizedBox.shrink(),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
