import 'package:white_jotter_app/entity/note_entity.dart';

noteEntityFromJson(NoteEntity data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = new List<NoteContent>();
		(json['content'] as List).forEach((v) {
			data.content.add(new NoteContent().fromJson(v));
		});
	}
	if (json['totalElements'] != null) {
		data.totalElements = json['totalElements']?.toInt();
	}
	if (json['pageNumber'] != null) {
		data.pageNumber = json['pageNumber']?.toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize']?.toInt();
	}
	if (json['first'] != null) {
		data.first = json['first'];
	}
	if (json['last'] != null) {
		data.last = json['last'];
	}
	if (json['empty'] != null) {
		data.empty = json['empty'];
	}
	if (json['totalPages'] != null) {
		data.totalPages = json['totalPages']?.toInt();
	}
	if (json['numberOfElements'] != null) {
		data.numberOfElements = json['numberOfElements']?.toInt();
	}
	return data;
}

Map<String, dynamic> noteEntityToJson(NoteEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.content != null) {
		data['content'] =  entity.content.map((v) => v.toJson()).toList();
	}
	data['totalElements'] = entity.totalElements;
	data['pageNumber'] = entity.pageNumber;
	data['pageSize'] = entity.pageSize;
	data['first'] = entity.first;
	data['last'] = entity.last;
	data['empty'] = entity.empty;
	data['totalPages'] = entity.totalPages;
	data['numberOfElements'] = entity.numberOfElements;
	return data;
}

noteContentFromJson(NoteContent data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['articleTitle'] != null) {
		data.articleTitle = json['articleTitle']?.toString();
	}
	if (json['articleContentHtml'] != null) {
		data.articleContentHtml = json['articleContentHtml']?.toString();
	}
	if (json['articleContentMd'] != null) {
		data.articleContentMd = json['articleContentMd']?.toString();
	}
	if (json['articleAbstract'] != null) {
		data.articleAbstract = json['articleAbstract']?.toString();
	}
	if (json['articleCover'] != null) {
		data.articleCover = json['articleCover']?.toString();
	}
	if (json['articleDate'] != null) {
		data.articleDate = json['articleDate']?.toString();
	}
	return data;
}

Map<String, dynamic> noteContentToJson(NoteContent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['articleTitle'] = entity.articleTitle;
	data['articleContentHtml'] = entity.articleContentHtml;
	data['articleContentMd'] = entity.articleContentMd;
	data['articleAbstract'] = entity.articleAbstract;
	data['articleCover'] = entity.articleCover;
	data['articleDate'] = entity.articleDate;
	return data;
}