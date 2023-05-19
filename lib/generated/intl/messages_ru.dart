// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Калькулятор ВС"),
        "avgPendingTime":
            MessageLookupByLibrary.simpleMessage("Среднее время ожидания"),
        "channelsQuantity":
            MessageLookupByLibrary.simpleMessage("Количество каналов"),
        "inputStreamIntensity": MessageLookupByLibrary.simpleMessage(
            "Интенсивность входного потока"),
        "loadFactor":
            MessageLookupByLibrary.simpleMessage("Коэфициент загрузки системы"),
        "noInputErrorLabelText":
            MessageLookupByLibrary.simpleMessage("Введите значение"),
        "pendingCapacity":
            MessageLookupByLibrary.simpleMessage("Число мест ожидания"),
        "queueLength": MessageLookupByLibrary.simpleMessage("Длина очереди"),
        "requestsQuantity":
            MessageLookupByLibrary.simpleMessage("Количество заявок"),
        "serviceTime":
            MessageLookupByLibrary.simpleMessage("Время обслуживания"),
        "stateProbabilities":
            MessageLookupByLibrary.simpleMessage("Вероятности состояний"),
        "stateProbability":
            MessageLookupByLibrary.simpleMessage("Вероятность состояния")
      };
}
