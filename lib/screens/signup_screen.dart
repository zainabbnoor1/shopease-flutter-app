import 'package:flutter/material.dart';
import 'package:shopease/auth_service.dart'; // ✅ import your AuthService file

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService(); // ✅ create instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up for ShopEase",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Email Field
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 20),

              // Confirm Password Field
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
              ),
              const SizedBox(height: 30),

              // ✅ Sign Up Button
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final pass = passwordController.text.trim();
                  final confirm = confirmPasswordController.text.trim();

                  if (email.isEmpty || pass.isEmpty || confirm.isEmpty) {
                    showError(context, "Please fill all fields.");
                    return;
                  }
                  if (pass != confirm) {
                    showError(context, "Passwords do not match.");
                    return;
                  }

                  // 🧠 Firebase Sign-Up
                  final user = await _authService.signUp(email, pass);

                  if (user != null) {
                    // ✅ Success
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully!"),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // ❌ Failed
                    showError(context, "Sign up failed. Please try again.");
                  }
                },
                child: const Text("Sign Up"),
              ),

              // Navigate to Login
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
