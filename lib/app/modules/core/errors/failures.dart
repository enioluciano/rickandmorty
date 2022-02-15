import 'dart:developer';

import 'package:flutter/material.dart';

abstract class Failure {
  final String erroMessage;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.erroMessage = '',
  }) {
    if (stackTrace != null) {
      log('------- DEBUG ------\n\n');
      debugPrintStack(label: label, stackTrace: stackTrace);
      log('------- LOG ------\n\n');
      log('Local do erro: $label');
      log(erroMessage);
    }
    //se tiver em prod --> enviará para o analytics
    // ErrorReport.externalFailureError(exception, stackTrace, label);
  }
}

class UnknowError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknowError({
    this.errorMessage = '',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
            erroMessage: errorMessage,
            label: label,
            exception: exception,
            stackTrace: stackTrace);
}
