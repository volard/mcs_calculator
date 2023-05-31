// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "MSS": MessageLookupByLibrary.simpleMessage("MSS"),
        "P_queue": MessageLookupByLibrary.simpleMessage("Queuing probability"),
        "PiThDescription": MessageLookupByLibrary.simpleMessage(
            "Probability indicating that system is in state of i, i < n + m"),
        "PnmDescription": MessageLookupByLibrary.simpleMessage(
            "Probability indicating that system is in state of n+m. In other words, its when all system\'s maintenance devices (or channels = n) are busy and buffer size (or pending capacity = m) is filled out, so any new request will be immediately rejected"),
        "absoluteThroughput":
            MessageLookupByLibrary.simpleMessage("Absolute throughput"),
        "appName": MessageLookupByLibrary.simpleMessage("MSC calculator"),
        "avgPendingTime":
            MessageLookupByLibrary.simpleMessage("Average pending time"),
        "channelsQuantity":
            MessageLookupByLibrary.simpleMessage("Channels quantity"),
        "channelsQuantityDescription": MessageLookupByLibrary.simpleMessage(
            "Quantity of channels (or maintenance devices in other words) proceeding incoming requests"),
        "constant": MessageLookupByLibrary.simpleMessage("Constant"),
        "finite": MessageLookupByLibrary.simpleMessage("Finite"),
        "infinite": MessageLookupByLibrary.simpleMessage("Infinite"),
        "inputStreamIntensity":
            MessageLookupByLibrary.simpleMessage("Input stream factor"),
        "inputStreamIntensityDescription": MessageLookupByLibrary.simpleMessage(
            "Quantity of incoming requests per unit time"),
        "loadFactor": MessageLookupByLibrary.simpleMessage("Load factor"),
        "massiveServiceSystem":
            MessageLookupByLibrary.simpleMessage("Mass Service System"),
        "noInputErrorLabelText":
            MessageLookupByLibrary.simpleMessage("Please input value"),
        "notAllFieldsFilledException":
            MessageLookupByLibrary.simpleMessage("Not all fields are filled"),
        "pZeroDescription": MessageLookupByLibrary.simpleMessage(
            "Probability indicating that system is in zero state"),
        "pendingCapacity":
            MessageLookupByLibrary.simpleMessage("Pending capacity"),
        "pendingCapacityDescription": MessageLookupByLibrary.simpleMessage(
            "Also known as buffer size. It\'s quantity of requests that can stay in system waiting for proceeding. Imagine it like amount of people that waiting their turn in a cashier queue in a store for example"),
        "queue": MessageLookupByLibrary.simpleMessage("Queue"),
        "queueLength": MessageLookupByLibrary.simpleMessage("Queue length"),
        "reject": MessageLookupByLibrary.simpleMessage("reject"),
        "relativeThroughput":
            MessageLookupByLibrary.simpleMessage("Relative throughput"),
        "requestRejectionProbability": MessageLookupByLibrary.simpleMessage(
            "request rejection probability"),
        "requestsQuantity":
            MessageLookupByLibrary.simpleMessage("Requests quantity"),
        "serviceTime": MessageLookupByLibrary.simpleMessage("Service time"),
        "serviceTimeDescription": MessageLookupByLibrary.simpleMessage(
            "Also known as service intensity. It\'s quantity of time needed to proceed one incoming request"),
        "stateProbabilities":
            MessageLookupByLibrary.simpleMessage("States probabilities"),
        "stateProbability":
            MessageLookupByLibrary.simpleMessage("State probability"),
        "where": MessageLookupByLibrary.simpleMessage("Where")
      };
}
