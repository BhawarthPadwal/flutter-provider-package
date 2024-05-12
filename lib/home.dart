import 'package:flutter/material.dart';
import 'package:next_level/list_provider.dart';
import 'package:next_level/second.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder:((context, numberListProvider, child) =>  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numberListProvider.add();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Provider Project'),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Text(numberListProvider.numbers.last.toString(), style: const TextStyle(fontSize: 20),),
              Expanded(
                child: ListView.builder(itemCount:numberListProvider.numbers.length, itemBuilder: (context, index) {
                  return Text(numberListProvider.numbers[index].toString(), style: const TextStyle(fontSize: 20),);
                }),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Second()));
                  },
                  child: const Text('Second Page'))
            ],
          ),
        ),
      )),
    );
  }
}
