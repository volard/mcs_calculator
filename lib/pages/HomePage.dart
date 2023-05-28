import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:mcs_calculator/main.dart';
import '../generated/l10n.dart';
import '../presentation/components/dynamic_line_chart_widget.dart';
import '../presentation/components/input_form.dart';
import '../presentation/components/results_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
        actions: [
          IconButton(
              onPressed: () {
                MyApp.setLocale(context, const Locale("en"));
              },
              icon: const Icon(Icons.language)),
          IconButton(onPressed: (){AdaptiveTheme.of(context).toggleThemeMode();}, icon: const Icon(Icons.ac_unit)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InputFormWidget(
                key: UniqueKey(),
              ),
              ResultsPane(
                key: UniqueKey(),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 44),
              //   child: DynamicLineChartWidget(
              //     key: UniqueKey(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
