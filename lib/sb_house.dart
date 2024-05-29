import 'package:flutter/material.dart';

class SbHouse extends StatefulWidget {
  const SbHouse({super.key});

  @override
  State<SbHouse> createState() => _SbHouseState();
}

class _SbHouseState extends State<SbHouse> {
  bool _isChecked = false;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {});
                      _isChecked = value!;
                    },
                  ),
                  const Text('체크박스'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_textController.text)),
                  );
                },
                child: const Text('저장'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
