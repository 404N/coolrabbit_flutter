import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:white_jotter_app/page/note_bloc/note_bloc.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/widget/note_widget.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NoteBloc()..add(NoteInitial()),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, NoteState state) {
          if (state.noteEntity == null) {
            return Container();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "笔记本",
                style: WjStyle.appBarStyle,
              ),
              backgroundColor: WJColors.color_F5F6F7,
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              color: WJColors.color_F5F6F7,
              child: EasyRefresh(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NoteWidget(state.noteEntity.content[index]);
                  },
                  itemCount: state.noteEntity.content.length,
                ),
                onRefresh: () async {
                  BlocProvider.of<NoteBloc>(context).add(NoteInitial());
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
