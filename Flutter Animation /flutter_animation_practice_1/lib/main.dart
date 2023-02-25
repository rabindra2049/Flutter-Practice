import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Implements SingleTickerProviderStateMixin to handle animation.
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  /// `initstate` is called when stateful widget is instantiated
  @override
  void initState() {
    super.initState();
    /// Animation Controller is created using the `AnimationController`
    /// Takes `@vsync` and `@duration` as arguments.
    /// `@vsync` Specifies the source of the ticks used to drive the animation, `this` indicate the state of ibject is ticker provider
    /// `@duration` specifies the duration of animation
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    /// Create animation object using `Tween` class
    /// `Tween` specifies range of values that an animation should use.
    /// Animation object is created using `animate()` method of `Tween` class.
    animation = Tween(begin: -1.0, end: 0.0).animate(
      /// `CurvedAnimation` define the curve that the animation will follow.
      /// `@parent` specifies the animation controller that will drive the animation
      /// `@curve` specifies the curve that will be used.
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    /// `forward()` method of animation controller is called to start the animation
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    /// `AnimatedBuilder` used to rebuild the widget tress whenever the animation changes
    /// `@animation` in AnimatedBuilder means that the widget will be rebuilt every time the animation controller updates the animation.
    /// `@builder` to build the widget
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          /// `Transform` widget applies a matrix transformation to its child widget
          /// Matrix transformation is a translation along x-axis.
          ///  animation.value is used to get the current value of the animation, which will be between -1.0 and 0.0.
          ///  This value is multiplied by the screen width to get the current position of the animation on the x-axis.
          body: Transform(
            transform:
            Matrix4.translationValues(animation.value * width, 0.0, 0.0),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Flutter animation basic',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () {},
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    /// dispose() method of the animationController is called to stop and release the animation.
    /// This is important because if the animation is not stopped and released, it could cause a memory leak.
    animationController.dispose();
    super.dispose();
  }
}

