import 'package:flutter/material.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/buttons_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/first_column_child.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/hello_world.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/layout_builder_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/max_berktold.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/max_steffen.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/media_query_example.dart';
import 'package:flutterbasics/presentation/widget_examples/widgets/row_expanded_example.dart';

class WidgetExampleScreen extends StatelessWidget {
  const WidgetExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Basics")),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              RowEpandedExample(),
              SizedBox(
                height: 20,
              ),
              FirstColumnChild(),
              SizedBox(
                height: 20,
              ),
              HelloWorld(),
              SizedBox(
                height: 20,
              ),
              MaxSteffen(),
              SizedBox(
                height: 20,
              ),
              MaxBerktold(),
              SizedBox(
                height: 40,
              ),
              MediaQueryExample(),
              SizedBox(
                height: 40,
              ),
              LayoutBuilderExample(),
              SizedBox(
                height: 40,
              ),
              ButtonExamples()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('clicked'),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
