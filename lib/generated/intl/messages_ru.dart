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
        "MSS": MessageLookupByLibrary.simpleMessage("СМО"),
        "P_queue": MessageLookupByLibrary.simpleMessage(
            "Вероятность образования очереди"),
        "PiThDescription": MessageLookupByLibrary.simpleMessage(
            "Вероятность того, что система находится в n+m состоянии. Другими словами, это когда все обслуживающие устройства (или каналы = n) заняты и длина очереди (или число мест ожидания = m) заполнена, поэтому любая новая заявка будет сразу отклонена"),
        "PnmDescription": MessageLookupByLibrary.simpleMessage(
            "Вероятность того, что система находится в i состоянии, i < n + m"),
        "absoluteThroughput": MessageLookupByLibrary.simpleMessage(
            "Абсолютная пропускная способность"),
        "appName": MessageLookupByLibrary.simpleMessage("Калькулятор ВС"),
        "avgPendingTime":
            MessageLookupByLibrary.simpleMessage("Среднее время ожидания"),
        "channelsQuantity":
            MessageLookupByLibrary.simpleMessage("Количество каналов"),
        "channelsQuantityDescription": MessageLookupByLibrary.simpleMessage(
            "Количество каналов (или обслуживающих устройств) обрабатывающих входящие заявки"),
        "constant": MessageLookupByLibrary.simpleMessage("Константа"),
        "finite": MessageLookupByLibrary.simpleMessage("Конечна"),
        "infinite": MessageLookupByLibrary.simpleMessage("Бесконечна"),
        "inputStreamIntensity": MessageLookupByLibrary.simpleMessage(
            "Интенсивность входного потока"),
        "inputStreamIntensityDescription": MessageLookupByLibrary.simpleMessage(
            "Количество поступающих заявок в единицу времени"),
        "loadFactor":
            MessageLookupByLibrary.simpleMessage("Коэфициент загрузки системы"),
        "massiveServiceSystem": MessageLookupByLibrary.simpleMessage(
            "Система массового обслуживания"),
        "noInputErrorLabelText":
            MessageLookupByLibrary.simpleMessage("Введите значение"),
        "pZeroDescription": MessageLookupByLibrary.simpleMessage(
            "Вероятность того, что система находится в нулевом состоянии"),
        "pendingCapacity":
            MessageLookupByLibrary.simpleMessage("Число мест ожидания"),
        "pendingCapacityDescription": MessageLookupByLibrary.simpleMessage(
            "Известный также, как размер буфера или число мест ожидания. Это количество заявок, которые могут оставаться в системе, ожидая их очереди на обработку. Представьте это, как количество человек, которые могут стоять в очереди на кассу, например"),
        "queue": MessageLookupByLibrary.simpleMessage("Очередь"),
        "queueLength": MessageLookupByLibrary.simpleMessage("Длина очереди"),
        "reject": MessageLookupByLibrary.simpleMessage("отказ"),
        "relativeThroughput": MessageLookupByLibrary.simpleMessage(
            "Относительная пропускная способность"),
        "requestRejectionProbability":
            MessageLookupByLibrary.simpleMessage("вероятность отказа заявки"),
        "requestsQuantity":
            MessageLookupByLibrary.simpleMessage("Количество заявок"),
        "serviceTime":
            MessageLookupByLibrary.simpleMessage("Время обслуживания"),
        "serviceTimeDescription": MessageLookupByLibrary.simpleMessage(
            "Также известный, как интенсивность обслуживания. Это количество времени, необходимое для обработки одной входящей заявки"),
        "stateProbabilities":
            MessageLookupByLibrary.simpleMessage("Вероятности состояний"),
        "stateProbability":
            MessageLookupByLibrary.simpleMessage("Вероятность состояния"),
        "where": MessageLookupByLibrary.simpleMessage("Где")
      };
}
