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

  /// `Quantity of incoming requests per unit time`
  String get inputStreamIntensityDescription {
    return Intl.message(
      'Quantity of incoming requests per unit time',
      name: 'inputStreamIntensityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Also known as service intensity. It's quantity of time needed to proceed one incoming request`
  String get serviceTimeDescription {
    return Intl.message(
      'Also known as service intensity. It\'s quantity of time needed to proceed one incoming request',
      name: 'serviceTimeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Quantity of channels (or maintenance devices in other words) proceeding incoming requests`
  String get channelsQuantityDescription {
    return Intl.message(
      'Quantity of channels (or maintenance devices in other words) proceeding incoming requests',
      name: 'channelsQuantityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Also known as buffer size. It's quantity of requests that can stay in system waiting for proceeding. Imagine it like amount of people that waiting their turn in a cashier queue in a store for example`
  String get pendingCapacityDescription {
    return Intl.message(
      'Also known as buffer size. It\'s quantity of requests that can stay in system waiting for proceeding. Imagine it like amount of people that waiting their turn in a cashier queue in a store for example',
      name: 'pendingCapacityDescription',
      desc: '',
      args: [],
    );
  }

  /// `<p> $$\rho = \frac{\lambda}{m \mu } $$ where <br> \(m\) - channels quantity <br> \(\mu\) - service time </p>`
  String get loadFactorDescription {
    return Intl.message(
      '<p> \$\$\\rho = \\frac{\\lambda}{m \\mu } \$\$ where <br> \\(m\\) - channels quantity <br> \\(\\mu\\) - service time </p>',
      name: 'loadFactorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Absolute throughput`
  String get absoluteThroughput {
    return Intl.message(
      'Absolute throughput',
      name: 'absoluteThroughput',
      desc: '',
      args: [],
    );
  }

  /// `Relative throughput`
  String get relativeThroughput {
    return Intl.message(
      'Relative throughput',
      name: 'relativeThroughput',
      desc: '',
      args: [],
    );
  }

  /// `Where`
  String get where {
    return Intl.message(
      'Where',
      name: 'where',
      desc: '',
      args: [],
    );
  }

  /// `reject`
  String get reject {
    return Intl.message(
      'reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Finite`
  String get finite {
    return Intl.message(
      'Finite',
      name: 'finite',
      desc: '',
      args: [],
    );
  }

  /// `Infinite`
  String get infinite {
    return Intl.message(
      'Infinite',
      name: 'infinite',
      desc: '',
      args: [],
    );
  }

  /// `Constant`
  String get constant {
    return Intl.message(
      'Constant',
      name: 'constant',
      desc: '',
      args: [],
    );
  }

  /// `Queue`
  String get queue {
    return Intl.message(
      'Queue',
      name: 'queue',
      desc: '',
      args: [],
    );
  }

  /// `Probability indicating that system is in zero state`
  String get pZeroDescription {
    return Intl.message(
      'Probability indicating that system is in zero state',
      name: 'pZeroDescription',
      desc: '',
      args: [],
    );
  }

  /// `Probability indicating that system is in state of n+m. In other words, its when all system's maintenance devices (or channels = n) are busy and buffer size (or pending capacity = m) is filled out, so any new request will be immediately rejected`
  String get PnmDescription {
    return Intl.message(
      'Probability indicating that system is in state of n+m. In other words, its when all system\'s maintenance devices (or channels = n) are busy and buffer size (or pending capacity = m) is filled out, so any new request will be immediately rejected',
      name: 'PnmDescription',
      desc: '',
      args: [],
    );
  }

  /// `request rejection probability`
  String get requestRejectionProbability {
    return Intl.message(
      'request rejection probability',
      name: 'requestRejectionProbability',
      desc: '',
      args: [],
    );
  }

  /// `<p> $$ \overline{\\W} = \frac{\\L}{\\A} $$ where <br> \(L\) - queue length <br> \(A\) - absolute throughput $$ A = \lambda Q $$ <br> where \(Q\) - relative throughput $$ Q = 1 - P_{\\reject} $$ where <br> \(P_{\\reject}\) - probability of request rejection $$ P_{\\reject} = \left[ \begin{\\array}{\\cl} 0 &, \ k = \infty \end{\\array} \right. $$ </p>`
  String get avgPendingTimeDescription {
    return Intl.message(
      '<p> \$\$ \\overline{\\\\W} = \\frac{\\\\L}{\\\\A} \$\$ where <br> \\(L\\) - queue length <br> \\(A\\) - absolute throughput \$\$ A = \\lambda Q \$\$ <br> where \\(Q\\) - relative throughput \$\$ Q = 1 - P_{\\\\reject} \$\$ where <br> \\(P_{\\\\reject}\\) - probability of request rejection \$\$ P_{\\\\reject} = \\left[ \\begin{\\\\array}{\\\\cl} 0 &, \\ k = \\infty \\end{\\\\array} \\right. \$\$ </p>',
      name: 'avgPendingTimeDescription',
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
