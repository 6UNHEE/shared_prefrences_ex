import 'package:flutter/material.dart';
import 'package:shared_prefrences_ex/shared.dart';

class SbHouse extends StatefulWidget {
  const SbHouse({super.key});

  @override
  State<SbHouse> createState() => _SbHouseState();
}

class _SbHouseState extends State<SbHouse> {
  bool _isChecked = Shared.getText.isNotEmpty;
  final _textController = TextEditingController(text: Shared.getText);
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SB_HOUSE'),
      ),
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
                  /* 입력을 잘 받는지 확인 -> 확인 완료 잘 받음 ^ㅡ^
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_textController.text)),
                  );
                  */
                  if (_isChecked) {
                    Shared.saveText(_textController.text);
                  } else {
                    Shared.removeText();
                  }
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
