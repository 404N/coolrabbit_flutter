import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';

class NoteEntity with JsonConvert<NoteEntity> {
	List<NoteContent> content;
	int totalElements;
	int pageNumber;
	int pageSize;
	bool first;
	bool last;
	bool empty;
	int totalPages;
	int numberOfElements;
}

class NoteContent with JsonConvert<NoteContent> {
	int id;
	String articleTitle;
	String articleContentHtml;
	String articleContentMd;
	String articleAbstract;
	String articleCover;
	String articleDate;
}
