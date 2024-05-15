import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA10505), Color(0xFF340D6C)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/aaa.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.translate(
                        offset: Offset(0, 50 - (50 * _animation.value)),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    'Welcome Back To Adham Math',
                    style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.translate(
                        offset: Offset(0, 50 - (50 * _animation.value)),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    'Adham Mohamed Marwan',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.translate(
                        offset: Offset(0, 50 - (50 * _animation.value)),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    '23/121036',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.translate(
                        offset: Offset(0, 50 - (50 * _animation.value)),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    'Mobile Developer & Problem Solver',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                SizedBox(height: 40),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.scale(
                        scale: _animation.value,
                        child: child,
                      ),
                    );
                  },
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => homemath()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Colors.white,
                    textColor: Color(0xFF11249F),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.scale(
                        scale: _animation.value,
                        child: child,
                      ),
                    );
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
