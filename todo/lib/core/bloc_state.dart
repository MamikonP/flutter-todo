import 'package:flutter/foundation.dart';

@immutable
abstract class BlocState {
  const BlocState(this.result, {required this.isBusy});

  final bool isBusy;
  final StateFlowResult? result;

  bool get isSuccess => result == StateFlowResult.success;
  bool get isFailed => result == StateFlowResult.failed;
}

enum StateFlowResult { success, failed }
