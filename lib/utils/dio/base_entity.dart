class BaseEntity<T> {

  String code;
  String msg;
  T data;

  BaseEntity(this.code, this.msg, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? json['Code'];
    msg = json['msg'] ?? json['Msg'];
    data = json['data'] ?? json['data'];
  }
}