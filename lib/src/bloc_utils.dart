import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  E? _lastEvent;

  BaseBloc(S initialState) : super(initialState);

  void dispatch(E event) {
    add(event);
  }

  void dispatchLastEvent() {
    if (_lastEvent != null) {
      dispatch(_lastEvent!);
    }
  }

  void forceReload() {
    dispatchLastEvent();
  }

  @override
  void onEvent(E event) {
    _lastEvent = event;
    super.onEvent(event);
  }

  @override
  // Default behavior is throwing an exception
  void onError(Object error, StackTrace stackTrace) {
    try {
      super.onError(error, stackTrace);
    } catch (err) {}
  }

  String get loggerTag => runtimeType.toString();
}

/// Same behavior as a [BaseBloc], but will emit the "-2" event when
/// [dispatchLastEvent] is called.
abstract class BaseTwoStepsHistoryBloc<E, S> extends BaseBloc<E, S> {
  late E? _lastPreviousEvent;

  BaseTwoStepsHistoryBloc(S initialState) : super(initialState);

  @override
  void onEvent(E event) {
    if (_lastEvent != null) {
      _lastPreviousEvent = _lastEvent;
    }

    super.onEvent(event);
  }

  @override
  void dispatchLastEvent() {
    if (_lastPreviousEvent != null) {
      dispatch(_lastPreviousEvent!);
    } else {
      super.dispatchLastEvent();
    }
  }
}
