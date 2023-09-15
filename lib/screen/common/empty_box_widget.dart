import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/dimesions.dart';

class EmptyBoxWidget extends StatelessWidget {
  const EmptyBoxWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimesion.screeHigh * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottiefiles/empty.json',
              repeat: false, width: 200, height: 200, fit: BoxFit.fill),
          Text(message,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                  )),
        ],
      ),
    );
  }
}
