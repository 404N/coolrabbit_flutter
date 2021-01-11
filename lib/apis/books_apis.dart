import 'package:white_jotter_app/entity/book_entity.dart';
import 'package:white_jotter_app/generated/json/base/json_convert_content.dart';
import 'package:white_jotter_app/utils/dio/address.dart';
import 'package:white_jotter_app/utils/dio/dio_util.dart';

class BookApis {
  Future<List<BookEntity>> getBooks() {
    return DioUtil.request(
      Address.getBooks(),
      RequestMethod.GET,
      tips: false,
      showLoading: true,
    ).then((value) {
      List<BookEntity> _list = [];
      value.data.result.forEach((p) {
        _list.add(JsonConvert.fromJsonAsT<BookEntity>(p));
      });
      return _list;
    });
  }
}