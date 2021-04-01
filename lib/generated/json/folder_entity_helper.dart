import 'package:white_jotter_app/model/folder_entity.dart';

folderEntityFromJson(FolderEntity data, Map<String, dynamic> json) {
	if (json['folderId'] != null) {
		data.folderId = json['folderId'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'].toString();
	}
	if (json['folderName'] != null) {
		data.folderName = json['folderName'].toString();
	}
	if (json['fatherId'] != null) {
		data.fatherId = json['fatherId'].toString();
	}
	return data;
}

Map<String, dynamic> folderEntityToJson(FolderEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['folderId'] = entity.folderId;
	data['userId'] = entity.userId;
	data['folderName'] = entity.folderName;
	data['fatherId'] = entity.fatherId;
	return data;
}