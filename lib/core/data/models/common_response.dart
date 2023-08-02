class CommonResponse<T> {
  //بحدد اذا الطلب ناجح او لا
  int? statusCode;
  //T=>القيمة الي بدخلها المطور//
  T? data;
  //رسالة الخطا الي رح يرجعها backend//
  String? message;
 //CommonResponse رح يرجع json 
  CommonResponse.fromJson(dynamic json) {
    //json['statusCode']=>>NetorkUtile
    this.statusCode = json['statusCode'];

    if (statusCode.toString().startsWith('2')) {
      this.data = json['response'];
    } else {
      if (json['response'] != null && json['response'] is Map) {
        this.message = json['response']['title'];
      } else {
        switch (statusCode) {
          case 400:
            this.message = '400 Bad Request';
            break;
          case 401:
            this.message = '401 UnAuthorized';
            break;
          case 404:
            this.message = '404 Not Found';
            break;
          case 500:
            this.message = '500 Internal Server error';
            break;
          case 503:
            this.message = '503  Server unavaliable';
            break;
        }
      }
    }
  }
  bool get getStutus => statusCode.toString().startsWith('2') ? true : false;
}
