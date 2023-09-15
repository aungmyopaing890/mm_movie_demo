// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/dialog/confirm_dialog_view.dart';
import '../widget/app_bar/appbar.dart';
import '../widget/home/home_dashboard_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);
  @override
  State<DashboardView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DashboardView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      return showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialogView(
                title: 'Confirm',
                description: 'Are you sure You want To Quit',
                leftButtonText: 'Cancel',
                rightButtonText: 'Ok',
                onAgreeTap: () {
                  Navigator.pop(context, true);
                });
          }).then((dynamic value) {
        if (value) {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        }
        return value;
      });
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: const DashboardAppBar(
          appBarTitleName: 'Home',
        ),
        body: const HomeDashboardViewWidget(),
      ),
    );
  }
}
