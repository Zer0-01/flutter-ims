import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/animation_constant.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:lottie/lottie.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => Dialog(
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
                              value: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            );
          },
          child: Text(context.l10n.register),
        ),
      ),
    );
  }
}
