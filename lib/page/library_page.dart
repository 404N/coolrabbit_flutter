import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:white_jotter_app/page/library_bloc/library_bloc.dart';
import 'package:white_jotter_app/utils/style/white_jotter_style.dart';
import 'package:white_jotter_app/widget/book_widget.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LibraryBloc()..add(LibraryInitial()),
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, LibraryState state) {
          if (state.list == null) {
            return Container();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "图书馆",
                style: WjStyle.appBarStyle,
              ),
              backgroundColor: WJColors.color_F5F6F7,
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              color: WJColors.color_F5F6F7,
              child: EasyRefresh(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return BookWidget(bookEntity: state.list[index],);
                  },
                  itemCount: state.list.length,
                ),
                onRefresh: () async {
                  BlocProvider.of<LibraryBloc>(context).add(LibraryInitial());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
