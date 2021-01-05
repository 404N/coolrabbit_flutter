part of 'home_bloc.dart';

class HomeState  {
  int selectIndex=0;

  HomeState init() {
    return HomeState()..selectIndex=0;
  }

  HomeState clone(){
    return HomeState()..selectIndex=selectIndex;
  }
}
