import 'package:flutter/material.dart';
import 'package:superellipse/superellipse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superellipse Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Superellipse Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {},
              color: Colors.grey,
              clipBehavior: Clip.antiAlias,
              shape: SuperellipseShape(
                radius: SuperellipseRadius.all(SuperRadius.value(_value)),
                side: BorderSide(
                  color: Colors.pink,
                  width: 4,
                ),
              ),
              minWidth: 100,
              height: 100,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: CustomPaint(
              painter: SuperellipsePainter(
                radius:
                    SuperellipseRadius.only(topLeft: SuperRadius.value(_value)),
              ),
              size: Size(100, 100),
            ),
          ),
          SizedBox(height: 20),
          Text('n=${_value.toStringAsFixed(1)}'),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56,
        child: Slider(
          value: _value,
          min: 0.01,
          max: 10,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
