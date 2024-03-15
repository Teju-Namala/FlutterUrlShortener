import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortener/shorten_url_page.dart';

Future<String> shortenURL(String longURL) async {
  const String accessToken = 'c3ab1f5f0e64114712b1c3d3b807f1f9dc57eed9';
  const String endpoint = 'https://api-ssl.bitly.com/v4/shorten';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  final Map<String, String> body = {
    'long_url': longURL,
  };

  final response = await http.post(Uri.parse(endpoint),
      headers: headers, body: json.encode(body));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['link'];
  } else {
    throw Exception('Failed to shorten URL: ${response.reasonPhrase}');
  }
}

void launchURL(BuildContext context, String url) async {
  String shortURL = await shortenURL(url);
  print('Shortened URL: $shortURL');
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ShortenedUrlPage(shortenedUrl: shortURL),
    ),
  );
}
