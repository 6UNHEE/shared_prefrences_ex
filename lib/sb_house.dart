import 'package:flutter/material.dart';

class SbHouse extends StatefulWidget {
  const SbHouse({super.key});

  @override
  State<SbHouse> createState() => _SbHouseState();
}

class _SbHouseState extends State<SbHouse> {
  bool _isChecked = false;
  final _textController = TextEditingController();
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('언어'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.nightlight),
              title: const Text('다크 모드'),
              trailing: Switch(
                value: _isChanged,
                onChanged: (value) {
                  setState(() {});
                  _isChanged = value;
                },
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
