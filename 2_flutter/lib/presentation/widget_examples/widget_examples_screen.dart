import 'package:flutter/material.dart';
import 'package:flutterbasics/application/theme_service.dart';
import 'package:flutterbasics/presentation/components/custom_button.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/buttons_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/first_column_child.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/hello_world.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/layout_builder_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/media_query_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/person.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/row_expanded_example.dart';
import 'package:provider/provider.dart';

class WidgetExampleScreen extends StatelessWidget {
  const WidgetExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Basics')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const RowEpandedExample(),
            const SizedBox(
              height: 20,
            ),
            const FirstColumnChild(),
            const SizedBox(
              height: 20,
            ),
            const HelloWorld(),
            const SizedBox(
              height: 20,
            ),
            const Person(
              name: 'Max Steffen',
              age: '32',
              country: 'germany',
              job: 'flutter expert and co-founder of tripmind',
              pictureUrl:
                  'https://media-exp1.licdn.com/dms/image/C4E03AQHZ3nboU2DB8w/profile-displayphoto-shrink_800_800/0/1645799763170?e=1662595200&v=beta&t=qg_sygyJbez3TnXoG4TQv4_qkwQ66gSNpg6a7ujEk-w',
            ),
            const SizedBox(
              height: 20,
            ),
            const Person(
              name: 'Max Berktold',
              age: '24',
              country: 'germany',
              job: 'flutter expert - community admin',
              pictureUrl:
                  'https://static.wixstatic.com/media/e38214_2415b962d0244310bb630e9cb6ac7010~mv2.jpg/v1/fill/w_388,h_372,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_5274_edited_edited_edited_edited.jpg',
            ),
            const SizedBox(
              height: 40,
            ),
            const MediaQueryExample(),
            const SizedBox(
              height: 40,
            ),
            const LayoutBuilderExample(),
            const SizedBox(
              height: 40,
            ),
            const ButtonExamples(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, '/screenOne');
              },
              icon: Icons.home,
              iconColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonGesture(
                onTap: () {
                  Navigator.pushNamed(context, '/screenTwo');
                },
                text: 'gesture button'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeService>(context, listen: false).toggleTheme();
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
