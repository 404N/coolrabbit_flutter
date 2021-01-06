import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:white_jotter_app/apis/note_apis.dart';
import 'package:white_jotter_app/entity/note_entity.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState().init());

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if(event is NoteInitial){
      NoteEntity noteEntity;
      await NoteApis().getNote(10, 1).then((notes) async {
        if (notes != null) {
          noteEntity=notes;
        }
      });
      yield NoteState()..noteEntity=noteEntity;
    }
  }
}
