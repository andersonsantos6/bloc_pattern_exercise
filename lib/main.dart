import 'package:bloc_pattern_exercise/bloc/count_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.stream,
              builder: (context, snapshot) {
                if (bloc.state == 0) {
                  return const Text('valor zerado...');
                } else {
                  return Text(bloc.state.count.toString());
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => bloc.add(Decrement()),
                    child: const Text('Decrement')),
                TextButton(
                    onPressed: () => bloc.add(Increment()),
                    child: const Text('Increment')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
