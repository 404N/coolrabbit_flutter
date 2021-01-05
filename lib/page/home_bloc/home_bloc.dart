import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is HomeSwitch){
      yield HomeState().clone()..selectIndex = event.index;
    }else if(event is HomeInitial){
      yield HomeState().clone()..selectIndex = 0;
    }
  }
}
