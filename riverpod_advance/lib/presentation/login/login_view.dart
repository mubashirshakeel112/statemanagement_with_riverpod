import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_advance/constant/strings.dart';
import 'package:riverpod_advance/presentation/login/notifier/login_notifier.dart';
import 'package:riverpod_advance/widgets/custom_button.dart';
import 'package:riverpod_advance/widgets/custom_loader.dart';
import 'package:riverpod_advance/widgets/custom_text_field.dart';

class LoginView extends ConsumerStatefulWidget {
  static const String id = '/login_view';

  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Login',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset(Strings.authIcon, width: 100, height: 100),
            SizedBox(height: 50),
            CustomTextField(
              margin: EdgeInsets.symmetric(horizontal: 20),
              hintText: 'Email',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Icon(Icons.email_outlined, color: Colors.grey),
              ),
              onChanged: (value) => loginNotifier.setUsername(value),
            ),
            SizedBox(height: 20),
            CustomTextField(
              margin: EdgeInsets.symmetric(horizontal: 20),
              hintText: 'Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Icon(Icons.lock_outline_sharp, color: Colors.grey),
              ),
              isSuffixIcon: true,
              suffixIcon: isPassword ? Icons.visibility_off_sharp : Icons.visibility,
              obscureText: isPassword,
              onSuffixIconPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              onChanged: (value) => loginNotifier.setPassword(value),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: loginState.isLoading
                  ? CustomLoader()
                  : PrimaryButton(
                      onPressed: () {
                        if (loginNotifier.isLoginValid) {
                          loginNotifier.login();
                        }
                      },
                      title: 'Login',
                    ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
