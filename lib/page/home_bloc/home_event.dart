part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitial extends HomeEvent{

}

class HomeSwitch extends HomeEvent{
  final int index;
  HomeSwitch(this.index);
}
