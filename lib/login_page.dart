import 'package:etherwallet/components/wallet/login_form.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LogInForm(
        errors: store.state.errors?.toList(),
        // TODO(techiejd): Refactor loading to somewhere that makes sense.
        onLogIn: !store.state.loading
            ? (username, passphrase) async {
                if (!await store.logIn(username, passphrase)) {
                  return;
                }

                Navigator.of(context).popAndPushNamed('/');
              }
            : null,
      ),
    );
  }
}
