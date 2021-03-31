import 'package:white_jotter_app/model/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['email'] = entity.email;
	data['name'] = entity.name;
	data['token'] = entity.token;
	return data;
}