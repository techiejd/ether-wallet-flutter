import 'package:etherwallet/components/wallet/login_form.dart';
import 'package:etherwallet/components/wallet/passphrase_form.dart';
import 'package:etherwallet/components/wallet/pin_form.dart';
import 'package:etherwallet/components/wallet/username_form.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:etherwallet/model/login_info.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);

    dynamic onLogIn(username, passphrase) async {
      if (!await store.logIn()) {
        return;
      }

      Navigator.of(context).popAndPushNamed('/');
    }

    if (store.logInInfo.isInputPending) {
      Navigator.of(context).push(OnboardingFlow.route());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LogInForm(
        onLogIn: onLogIn,
      ),
    );
  }
}

class OnboardingFlow extends StatelessWidget {
  const OnboardingFlow({Key? key}) : super(key: key);

  static Route<LogInInfo> route() {
    return MaterialPageRoute(builder: (_) => const OnboardingFlow());
  }

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);

    void onUserNameSubmission(String uname) {
      context
          .flow<LogInInfo>()
          .update((logInInfo) => logInInfo.rebuild((l) => l..username = uname));
    }

    void onPassphraseSubmission(String passphrase) {
      context.flow<LogInInfo>().update(
          (logInInfo) => logInInfo.rebuild((l) => l..passphrase = passphrase));
    }

    void onPinSubmission(int pin) {
      context
          .flow<LogInInfo>()
          .complete((logInInfo) => logInInfo.rebuild((l) => l..pin = pin));
    }

    return Scaffold(
        body: FlowBuilder<LogInInfo>(
            state: store.logInInfo,
            onGeneratePages: (logInInfo, pages) {
              return [
                MaterialPage(
                    child: UsernameForm(onSubmit: onUserNameSubmission)),
                MaterialPage(
                    child: PassphraseForm(onSubmit: onPassphraseSubmission)),
                MaterialPage(child: PinForm(onSubmit: onPinSubmission)),
              ];
            }));
  }
}
