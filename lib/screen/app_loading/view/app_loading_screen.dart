import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/route/route_paths.dart';
import '../../../core/constant/dimesions.dart';

class AppLoadingView extends StatefulWidget {
  const AppLoadingView({super.key});

  @override
  State<AppLoadingView> createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<AppLoadingView>
    with TickerProviderStateMixin {
  late NavigatorState navigator;
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    Timer(const Duration(seconds: 5), () async {
      await Navigator.pushReplacementNamed(
        context,
        RoutePaths.home,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScaleTransition(
          scale: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: Dimesion.height40 * 5,
                  width: Dimesion.height40 * 5,
                  padding: EdgeInsets.all(Dimesion.height30),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              SizedBox(
                height: Dimesion.height10,
              ),
              Center(
                child: Text("Welcome To Movie Demo",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ],
          )),
    );
  }
}
