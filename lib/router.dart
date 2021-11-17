import 'package:etherwallet/model/network_type.dart';
import 'package:etherwallet/qrcode_reader_page.dart';
import 'package:etherwallet/service/configuration_service.dart';
import 'package:etherwallet/utils/route_utils.dart';
import 'package:etherwallet/wallet_main_page.dart';
import 'package:etherwallet/wallet_transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context/setup/wallet_setup_provider.dart';
import 'context/transfer/wallet_transfer_provider.dart';
import 'context/wallet/wallet_provider.dart';
import 'login_page.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    '/': (BuildContext context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet())
        return WalletProvider(
            // ignore: prefer_const_constructors
            builder: (context, store) => WalletMainPage('Your wallet'));

      return WalletSetupProvider(
        builder: (context, store) => const LogInPage('Log in'),
      );
    },
    '/transfer': (BuildContext context) => WalletTransferProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => WalletTransferPage(
            title: 'Send Tokens',
            network: getRouteArgs<NetworkType>(context),
          ),
        ),
    '/qrcode_reader': (BuildContext context) => QRCodeReaderPage(
          title: 'Scan QRCode',
          onScanned: ModalRoute.of(context)?.settings.arguments as OnScanned?,
        )
  };
}
