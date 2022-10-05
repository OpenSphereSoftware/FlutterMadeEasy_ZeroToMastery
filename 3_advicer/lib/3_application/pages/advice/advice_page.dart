import 'package:advicer/3_application/core/services/theme_service.dart';
import 'package:advicer/3_application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/3_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Advicer',
            style: themeData.textTheme.headline1,
          ),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children:  const [
              Expanded(
                  child: Center(
                child: ErrorMessage(message: 'uuups something gone wrong!')
                //AdviceField(advice: 'example advice - your day will be good!',)
                /*CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,)*/
                /*Text(
                  'Your Advice is waiting for you!',
                  style: themeData.textTheme.headline1,
                ),*/
              )),
              SizedBox(height: 200, child: Center(child: CustomButton()))
            ],
          ),
        ));
  }
}
