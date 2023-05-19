// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Average pending time`
  String get avgPendingTime {
    return Intl.message(
      'Average pending time',
      name: 'avgPendingTime',
      desc: '',
      args: [],
    );
  }

  /// `Channels quantity`
  String get channelsQuantity {
    return Intl.message(
      'Channels quantity',
      name: 'channelsQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Load factor`
  String get loadFactor {
    return Intl.message(
      'Load factor',
      name: 'loadFactor',
      desc: '',
      args: [],
    );
  }

  /// `Input stream factor`
  String get inputStreamIntensity {
    return Intl.message(
      'Input stream factor',
      name: 'inputStreamIntensity',
      desc: '',
      args: [],
    );
  }

  /// `Pending capacity`
  String get pendingCapacity {
    return Intl.message(
      'Pending capacity',
      name: 'pendingCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Queue length`
  String get queueLength {
    return Intl.message(
      'Queue length',
      name: 'queueLength',
      desc: '',
      args: [],
    );
  }

  /// `Requests quantity`
  String get requestsQuantity {
    return Intl.message(
      'Requests quantity',
      name: 'requestsQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Service time`
  String get serviceTime {
    return Intl.message(
      'Service time',
      name: 'serviceTime',
      desc: '',
      args: [],
    );
  }

  /// `State probability`
  String get stateProbability {
    return Intl.message(
      'State probability',
      name: 'stateProbability',
      desc: '',
      args: [],
    );
  }

  /// `States probabilities`
  String get stateProbabilities {
    return Intl.message(
      'States probabilities',
      name: 'stateProbabilities',
      desc: '',
      args: [],
    );
  }

  /// `MSC calculator`
  String get appName {
    return Intl.message(
      'MSC calculator',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Please input value`
  String get noInputErrorLabelText {
    return Intl.message(
      'Please input value',
      name: 'noInputErrorLabelText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
