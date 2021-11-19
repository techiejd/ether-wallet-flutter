import 'package:etherwallet/components/form/paper_form.dart';
import 'package:etherwallet/components/form/paper_input.dart';
import 'package:etherwallet/components/form/paper_validation_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UsernameForm extends HookWidget {
  const UsernameForm({Key? key, this.onSubmit}) : super(key: key);

  final Function(String username)? onSubmit;
  List<String>? errors() => [];

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: PaperForm(
            padding: 30,
            actionButtons: <Widget>[
              ElevatedButton(
                child: const Text('Log in'),
                onPressed: onSubmit != null
                    ? () => onSubmit!(usernameController.value.text)
                    : null,
              )
            ],
            children: <Widget>[
              Column(
                children: <Widget>[
                  fieldForm(
                      label: 'Username',
                      hintText: 'Type your username',
                      controller: usernameController),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldForm({
    required String label,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Column(
      children: <Widget>[
        if (errors() != null) PaperValidationSummary(errors()!),
        PaperInput(
          labelText: label,
          hintText: hintText,
          maxLines: 3,
          controller: controller,
        ),
      ],
    );
  }
}
