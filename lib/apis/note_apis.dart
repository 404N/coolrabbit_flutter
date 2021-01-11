import 'package:white_jotter_app/entity/note_entity.dart';
import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';

class NoteApis {
  Future<NoteEntity> getNote(int size, int page) {
    return DioUtil.request(
      Address.getNote(size,page),
      RequestMethod.GET,
      tips: false,
      showLoading: true,
    ).then((value) {
      return JsonConvert.fromJsonAsT<NoteEntity>(value.data.result);
    });
  }
}
