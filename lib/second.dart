import 'package:flutter/material.dart';
import 'package:next_level/list_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberListProvider>(
      builder: ((context, numberListProvider, child) => Scaffold(
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
              Container(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount:numberListProvider.numbers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return Text("${numberListProvider.numbers[index]} ", style: const TextStyle(fontSize: 20),);
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
