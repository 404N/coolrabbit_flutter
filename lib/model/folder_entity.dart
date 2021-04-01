import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';

class FolderEntity with JsonConvert<FolderEntity> {
	String folderId;
	String userId;
	String folderName;
	String fatherId;
}
