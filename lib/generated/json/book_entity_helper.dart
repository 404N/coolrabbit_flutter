import 'package:white_jotter_app/entity/book_entity.dart';

bookEntityFromJson(BookEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toDouble();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['press'] != null) {
		data.press = json['press']?.toString();
	}
	if (json['abs'] != null) {
		data.abs = json['abs']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['category'] != null) {
		data.category = new BookCategory().fromJson(json['category']);
	}
	return data;
}

Map<String, dynamic> bookEntityToJson(BookEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['author'] = entity.author;
	data['date'] = entity.date;
	data['press'] = entity.press;
	data['abs'] = entity.abs;
	data['cover'] = entity.cover;
	if (entity.category != null) {
		data['category'] = entity.category.toJson();
	}
	return data;
}

bookCategoryFromJson(BookCategory data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toDouble();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> bookCategoryToJson(BookCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}