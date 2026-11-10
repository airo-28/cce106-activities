import 'package:flutter/material.dart';
import 'package:flutter_application_1/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errorMessage;
  late bool isError;

  @override
  void initState() {
    errorMessage = 'This is an error message.';
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkLogin(username, password) {
    setState(() {
      if (username == '') {
        errorMessage = 'Please input your username!';
        isError = true;
      } else if (password == '') {
        errorMessage = 'Please input your password!';
        isError = true;
      } else {
        errorMessage = '';
        isError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 12),
                      Text('TIKITOKTOK', style: txtstyle),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      checkLogin(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (!isError) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SocialMedia(),
                          ),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var txtstyle = const TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

var registertxtstyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

var errortxtstyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);
