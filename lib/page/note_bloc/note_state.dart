part of 'note_bloc.dart';


class NoteState {
  NoteEntity noteEntity;
  NoteState init() {
    return NoteState()..noteEntity=null;
  }

  NoteState clone() {
    return NoteState()..noteEntity=noteEntity;
  }
}

