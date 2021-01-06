part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class NoteInitial extends NoteEvent{
}

class SwitchPage extends NoteEvent{
  final List<NoteEntity> noteEntity;

  SwitchPage(this.noteEntity);
}
