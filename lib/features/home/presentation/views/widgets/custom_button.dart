import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffed8161),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15
                  ),
                ),
              ),
              child: Text(
                text,
                style: Styles.title18.copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
