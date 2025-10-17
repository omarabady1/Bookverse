import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errorMessage,{
    super.key,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8), child: Center(child: Text(errorMessage, style: Styles.sectra20, textAlign: TextAlign.center,)));
  }
}