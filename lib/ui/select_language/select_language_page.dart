import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:routefly/routefly.dart';
import 'package:valorant_app/app_widget.dart';
import 'package:valorant_app/config/dependecy_injector.dart';
import 'package:valorant_app/shared/enums/language_enum.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/intl/vava_intl_button_item.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/intl/vava_intl_button_list_control.dart';
import 'package:valorant_app/ui/design_system/widgets/buttons/vava_button.dart';
import 'package:valorant_app/ui/select_language/viewmodel/select_language_viewmodel.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  //
  final viewModel = dependecyInjector.get<SelectLanguageViewmodel>();
  var _languageSelected = LanguageEnum.portuguese;

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {});
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _selectLanguage(LanguageEnum language) {
    setState(() {
      _languageSelected = language;
    });
  }

  void _setAppLanguage() {
    viewModel.setLanguage.execute(_languageSelected.acronym);
  }

  void _goToAgentsPage() {
    _setAppLanguage();
    Routefly.push(routePaths.agents);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24), //
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                Text(
                  'Select your language', //
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(30),
                Expanded(
                  child: VavaIntlButtonListControl(
                    onChanged: _selectLanguage,
                    children: [
                      VavaIntlButtonItem(
                        language: LanguageEnum.portuguese,
                        onPressed: () {},
                      ),
                      VavaIntlButtonItem(
                        language: LanguageEnum.english,
                        onPressed: () {},
                      ),
                      VavaIntlButtonItem(
                        language: LanguageEnum.spanish,
                        onPressed: () {},
                      ),
                      VavaIntlButtonItem(
                        language: LanguageEnum.chinese,
                        onPressed: () {},
                      ),
                      VavaIntlButtonItem(
                        language: LanguageEnum.france,
                        onPressed: () {},
                      ),
                      VavaIntlButtonItem(
                        language: LanguageEnum.german,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                VavaButton(
                  text: 'Continue',
                  onPressed: _goToAgentsPage, //
                ),
                Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
