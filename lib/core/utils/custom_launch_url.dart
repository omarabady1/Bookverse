import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> customLaunchUrl(BuildContext context, String? url) async {
  if (url != null) {
    var uri = Uri.parse(
      url.replaceAll('http', 'https'),
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }else{
      if(!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Couldn\'t open link.' ))
      );
    }
  }
}