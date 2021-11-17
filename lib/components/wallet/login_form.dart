import 'package:etherwallet/components/form/paper_form.dart';
import 'package:etherwallet/components/form/paper_input.dart';
import 'package:etherwallet/components/form/paper_validation_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LogInForm extends HookWidget {
  const LogInForm({Key? key, this.onLogIn, this.errors}) : super(key: key);

  final Function(String username, String passphrase)? onLogIn;
  final List<String>? errors;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passphraseController = useTextEditingController();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: PaperForm(
            padding: 30,
            actionButtons: <Widget>[
              ElevatedButton(
                child: const Text('Log in'),
                onPressed: onLogIn != null
                    ? () => onLogIn!(usernameController.value.text,
                        passphraseController.value.text)
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
                  fieldForm(
                      label: 'Passphrase',
                      hintText: 'Type your passphrase',
                      controller: passphraseController),
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
        if (errors != null) PaperValidationSummary(errors!),
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
