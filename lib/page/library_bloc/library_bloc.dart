import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:white_jotter_app/apis/books_apis.dart';
import 'package:white_jotter_app/entity/book_entity.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryState().init());

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    if(event is LibraryInitial){
      List<BookEntity> list;
      await BookApis().getBooks().then((books) async {
        if (books != null) {
          list=books;
        }
      });
      yield LibraryState()..list=list;
    }
  }
}
