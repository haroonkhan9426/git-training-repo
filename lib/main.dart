import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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

class _MyHomePageState extends State<MyHomePage> {
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Welcome to flutter"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text_01',
            ),
            Text(
              'Text_02',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.phone),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
