import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreetingPageWidget extends StatelessWidget {
  const GreetingPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://unsplash.it/1920/1920'),
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              height: 32,
            ),
            Text('Hello there 👋', style: TextStyle(fontSize: 30)),
            Text('This is my submission for Assignment 4'),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/calculator');
                  },
                  child: Text('Interest Calculator'),
                ),
                SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/notes');
                  },
                  child: Text('Notes'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
