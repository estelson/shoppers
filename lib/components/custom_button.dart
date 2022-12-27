import 'package:flutter/material.dart';
import 'package:shoppers/components/loader.dart';
import 'package:shoppers/utils/custom_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool isLoading;

  const CustomButton({Key? key, required this.text, required this.onPress, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: CustomTheme.yellow,
        boxShadow: CustomTheme.buttonShadow,
      ),
      child: MaterialButton(
        onPressed: isLoading ? null : onPress,
        child: isLoading
            ? const Loader()
            : Text(
                text,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ),
    );
  }
}
