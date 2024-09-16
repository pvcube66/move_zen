import 'package:flutter/material.dart';
import './signup_page.dart'; // Assuming you have the SignUpPage already implemented
import './forgot_password.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            color: const Color(0xFF0CAAA7), // Teal color
            height: MediaQuery.of(context).size.height,
          ),
          // Positioned Clouds (optional - add cloud image if needed)
          Positioned(
            top: 50,
            left: 30,
            child: Image.asset(
              'assets/images/cloud.png', // Cloud image
              width: 120,
              height: 80,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back arrow and title
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in to Movezen!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Google login button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google Sign-in
                      },
                      icon: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
                        height: 20,
                        width: 20,
                      ),
                      label: const Text(
                        'Log in with Google',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 50.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                 const Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or log in with Email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Username or Email Input
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Username or Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Password Input
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      suffixIcon: TextButton(
                        onPressed: () {
                          // Handle forgot password
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginTroubleScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login action
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 100.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign up link
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Scooter Image at the bottom
          Positioned(
            bottom: 10,
            right: 0,
            child: Image.asset(
              'assets/images/scooter.png', // Scooter image path
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
