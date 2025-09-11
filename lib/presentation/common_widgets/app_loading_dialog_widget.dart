import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/animation_constant.dart';
import 'package:lottie/lottie.dart';

class AppLoadingDialogWidget extends StatelessWidget {
  const AppLoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.height * 0.2,
          child: Lottie.asset(
            AnimationConstant.animationDeliveryTruckLoading,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.colorFilter(
                  const ['**'],
                  value: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
