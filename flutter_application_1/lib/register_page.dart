import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService auth = AuthService();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register - Parondo")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Register"),
                onPressed: () async {
                  if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty)
                    return;
                  setState(() => loading = true);

                  final user = await auth.registerWithEmail(
                    emailCtrl.text.trim(),
                    passwordCtrl.text,
                  );

                  setState(() => loading = false);
                  if (!mounted) return;

                  if (user != null) {
                    // Send verification email
                    if (!user.emailVerified) {
                      await user.sendEmailVerification();
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Verification email sent. Please check your inbox.",
                          ),
                        ),
                      );
                    }
                    // Sign out so they must verify before logging in
                    await auth.signOut();
                    if (!mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Registration failed")),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              TextButton(
                child: const Text("Already have an account? Login"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
