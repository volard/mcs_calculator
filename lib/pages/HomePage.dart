import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:mcs_calculator/main.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/components/dynamic_line_chart_widget.dart';
import '../presentation/components/input_form.dart';
import '../presentation/components/results_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IconData themeIcon;
  // TODO add language icon -> check current language -> implement sharePreferences

  @override
  Widget build(BuildContext context) {
    if (AdaptiveTheme.of(context).theme ==
        AdaptiveTheme.of(context).darkTheme) {
      themeIcon = Icons.light_mode;
    } else {
      themeIcon = Icons.dark_mode;
    }

    void toggleTheme() {
      AdaptiveTheme.of(context).toggleThemeMode();

      setState(() {
        if (AdaptiveTheme.of(context).theme ==
            AdaptiveTheme.of(context).darkTheme) {
          themeIcon = Icons.light_mode;
        } else {
          themeIcon = Icons.dark_mode;
        }
      });
    }

    void toggleLanguage() {
      MyApp.toggleLocale(context);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calculate),
        onPressed: () {
          bool isCalculationSuccessful =
              Provider.of<ComputingSystemModel>(context, listen: false)
                  .calculate();

          if (!isCalculationSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(
                10.0,
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(
                  textAlign: TextAlign.center,
                  S.of(context).notAllFieldsFilledException),
            ));
          }
        },
      ),
      appBar: AppBar(
        title: Text(S.of(context).appName),
        actions: [
          IconButton(
              onPressed: toggleLanguage,
              icon: Padding(
                padding: const EdgeInsets.all(2.5),
                child: FittedBox(
                  child: SvgPicture.asset(
                    "assets/english_usa.svg",
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn),
                    semanticsLabel: 'Acme Logo',
                    width: 40,
                    height: 40,
                  ),
                ),
              )),
          IconButton(onPressed: toggleTheme, icon: Icon(themeIcon)),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 44, bottom: 50, left: 5, right: 5),
                child: DynamicLineChartWidget(
                  key: UniqueKey(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
