import 'package:flutter/material.dart';
import 'package:bloc_samples/blocs/home_v2_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counterBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    print('Build........');
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Com BLOC Pattern:',
            ),
            StreamBuilder(
              stream: counterBloc.counter,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return _buildText(snapshot.data);

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterBloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Text _buildText(int value) {
    return Text(
      '$value',
      style: Theme.of(context).textTheme.display1,
    );
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }
}
