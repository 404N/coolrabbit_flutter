import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	String email;
	String name;
	String token;
}
