import 'package:change_notifier_demo/controller.dart';
import 'package:change_notifier_demo/model.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add data',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            18.0,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter your name'
                          : null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Controller().addData(
                            Model(
                              _controller.value.text,
                            ),
                          );
                          Navigator.of(context).pop();
                          return;
                        }
                      },
                      child: const Text(
                        'Submit',
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
