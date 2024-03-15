import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class ShortenedUrlPage extends StatelessWidget {
  final String shortenedUrl;
  const ShortenedUrlPage({super.key, required this.shortenedUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Shortened URL',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shortened URL: $shortenedUrl',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FlutterClipboard.copy(shortenedUrl).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('URL copied to clipboard')),
                  );
                });
              },
              child: const Text(
                'Copy to Clipboard',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
