import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package
import './pages/welcome_page.dart';
import './pages/home_page.dart'; // Assuming this is your home page

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Check login state after the animation
    _controller.forward().then((_) {
      _checkLoginStatus();
    });
  }

  // Function to check if the user is logged in
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // Navigate to home page if the user is already logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MapScreen()), // Assuming HomePage is your main screen
      );
    } else {
      // If not logged in, navigate to WelcomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0CAAA7), // Teal background color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background pattern
          CustomPaint(
            painter: BackgroundPatternPainter(),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpg', // Path to your MZ logo image
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover, // Ensures the image fits properly within the circular frame
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final carPath = Path()
      ..moveTo(0, 10)
      ..lineTo(20, 10)
      ..lineTo(25, 5)
      ..lineTo(35, 5)
      ..lineTo(40, 10)
      ..lineTo(60, 10)
      ..lineTo(60, 20)
      ..lineTo(0, 20)
      ..close();

    for (var i = 0; i < size.width; i += 80) {
      for (var j = 0; j < size.height; j += 40) {
        canvas.save();
        canvas.translate(i.toDouble(), j.toDouble());
        canvas.drawPath(carPath, paint);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
