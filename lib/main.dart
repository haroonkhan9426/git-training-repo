import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Antonx-Training",
    debugShowCheckedModeBanner: false,
    home: _MyTraining(),
  );
  }
}
class _MyTraining extends StatefulWidget {
  @override
  _MyTrainingState createState() => _MyTrainingState();
}

class _MyTrainingState extends State<_MyTraining> {
  int counter=0;
  int get getCounter => counter;

  _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VCS practice"),
        centerTitle: true,
      ),
      body: MyInheritedWidget(
        mystate: this,
        child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          showText(context),
          showPrimaryButtons(context),
        ],
      ),
    );
  }

  showText(BuildContext context) {
    final mystatus = MyInheritedWidget.of(context).mystate;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "You have push the button this many time\n",
       style: TextStyle(
         color: Colors.black54,
         fontSize: 18.0
       )
        ),
        TextSpan(
            text: "\t\t\t\t\t\t\t\t\t\t\t\t\t\t${mystatus.counter}",
            style: Theme.of(context).textTheme.headline4),
      ])),
    );
  }

  showPrimaryButtons(BuildContext context) {
    final mystatus = MyInheritedWidget.of(context).mystate;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () {
          mystatus._increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _MyTrainingState mystate;
  MyInheritedWidget({Key key, Widget child, @required this.mystate})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.mystate.getCounter != oldWidget.mystate.getCounter;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(
        aspect: MyInheritedWidget);
  }
}
