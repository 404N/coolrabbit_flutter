import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';

class BookEntity with JsonConvert<BookEntity> {
	double id;
	String title;
	String author;
	String date;
	String press;
	String abs;
	String cover;
	BookCategory category;
}

class BookCategory with JsonConvert<BookCategory> {
	double id;
	String name;
}
