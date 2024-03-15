import 'package:flutter/material.dart';
import 'package:url_shortener/url_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController urlController;

  @override
  void initState() {
    urlController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset('assets/images/discussion.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'URL Shortner',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              const Text('Shortens your lengthly URL'),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.link_sharp),
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: 'Paste the link',
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2))),
                ),
              ),
              const Text('Give some lenghty URL to bite'),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {
                    String enteredURL = urlController.text;
                    print(enteredURL);
                    launchURL(context, enteredURL);
                  },
                  child: const Text(
                    'GET LINK',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
