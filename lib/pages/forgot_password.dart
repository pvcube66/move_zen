import 'package:flutter/material.dart';
import './login_page.dart';
import './signup_page.dart';

class LoginTroubleScreen extends StatelessWidget {
  const LoginTroubleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF0CAAA7),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0CAAA7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.lock_outline, size: 60, color: Colors.white),
              const SizedBox(height: 20),
              _buildHeaderText(),
              const SizedBox(height: 30),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildSendLinkButton(context),
              const SizedBox(height: 20),
              _buildResetPasswordText(),
              const SizedBox(height: 30),
              const Center(child: Text('Or', style: TextStyle(color: Colors.white))),
              const SizedBox(height: 30),
              _buildCreateAccountButton(context),
              const SizedBox(height: 20),
              _buildBackToLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Column(
      children: [
        Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Enter your email or phone number and we will\nsend you a link to get back to your account',
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter email or phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSendLinkButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Send login link'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // TODO: Implement send login link functionality
      },
    );
  }

  Widget _buildResetPasswordText() {
    return const Center(
      child: Text(
        'Can\'t reset your password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return OutlinedButton(
      child: const Text('Create new account'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
    );
  }

  Widget _buildBackToLoginButton(BuildContext context) {
    return TextButton(
      child: const Text('Back to login', style: TextStyle(color: Colors.white)),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
    );
  }
}