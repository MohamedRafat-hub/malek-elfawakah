import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver
{
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change in ${bloc.runtimeType} : $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create bloc ${bloc.runtimeType}');
  }

  @override
  void onDone(Bloc bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('error in bloc ${bloc.runtimeType} : $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }

}