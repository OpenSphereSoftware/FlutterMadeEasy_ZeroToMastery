import 'package:flutter/material.dart';
import 'package:flutterbasics/application/theme_service.dart';
import 'package:flutterbasics/presentation/theme_animation/widgets/moon.dart';
import 'package:flutterbasics/presentation/theme_animation/widgets/star.dart';
import 'package:flutterbasics/presentation/theme_animation/widgets/sun.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Animation'),
      ),
      body: Consumer<ThemeService>(builder: ((context, themeService, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: themeService.isDarkModeOn
                            ? Colors.black.withOpacity(0.7)
                            : Colors.grey,
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: themeService.isDarkModeOn
                        ? const [
                            Color(0xFF94A9FF),
                            Color(0xFF6B66CC),
                            Color(0xFF200F75),
                          ]
                        : const [
                            Color(0xDDFFFA66),
                            Color(0xDDFFA057),
                            Color(0xDD940B99)
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    right: 50,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 150,
                    left: 60,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 40,
                    left: 100,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 100,
                    right: 200,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    top: themeService.isDarkModeOn ? 100 : 130,
                    right: themeService.isDarkModeOn ? 100 : -40,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Moon()),
                  ),
                  AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(
                          top: themeService.isDarkModeOn ? 110 : 50),
                      child: const Center(child: Sun())),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: themeService.isDarkModeOn
                              ? Colors.grey[800]
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            themeService.isDarkModeOn
                                ? 'To dark?'
                                : 'To bright?',
                            style: const TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            themeService.isDarkModeOn
                                ? 'let the sun rise'
                                : 'let it be night',
                            style: const TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Switch(
                              value: themeService.isDarkModeOn,
                              onChanged: (_) {
                                themeService.toggleTheme();
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
