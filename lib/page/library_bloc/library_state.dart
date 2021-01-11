part of 'library_bloc.dart';

class LibraryState {
  List<BookEntity> list;
  LibraryState init(){
    return LibraryState()..list=null;
  }

  LibraryState clone(){
    return LibraryState()..list=list;
  }
}

