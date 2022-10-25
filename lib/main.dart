import 'package:bloc_pattern_exercise/bloc/count_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Pattern'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {
              if (bloc.state == 0) {
                return const Text('valor zerado...');
              } else {
                return Text(bloc.state.toString());
                
              }
            },
          ),
          
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => bloc.add(Increment()),
            child: const Icon(Icons.add)),
      ),
    );
  
  }
  
  
}

