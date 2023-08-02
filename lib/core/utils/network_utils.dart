import 'dart:convert';

import 'package:fluter_template/core/data/enums/message_type.dart';
import 'package:fluter_template/core/data/enums/reouest_type.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_toast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required RequestType requestType,
    required String url,
    //لكل شي قيم بدها تطلع مع الطلب بشكل مستمر متل اللغة او السماحية
    Map<String, String>? headers,
    //اعلى طبقة من الحماية لارسال البيانات
    Map<String, dynamic>? body,
    // غير امن رح يطلع مع الرابط
    Map<String, dynamic>? params,
  }) async {
    try {
      //baseUrl////هو القسم الثابت الي بيتغير بكون لعند .com//////
      var uri = Uri.https(baseUrl, url, params);

      //رح يرجعلي قيمة من api///رح نستعمله لاحقا بعمليات decoded////
      late http.Response response;

      //دمجنا  فيها (statusCode and response )الي راجعين من api///
      Map<String, dynamic> jsonResponse = {};

      switch (requestType) {
        case RequestType.GET:
          // api=< response  <=  عم نخزن رد
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              headers: headers, body: jsonEncode(body));
          break;

        case RequestType.MULTIPART:
          // TODO: Handle this case.
          break;
      }
      //عند تسجيل الدخول لما دخلنا كلمة المرور غلط بيرجعلنا (respons)=>String
      //حلينا المشكلة عن طريق (jsonDecode)
      dynamic result;
      try {
        result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
      }
      //catch مابتتاثر اذا التعليمة الي قبلها ما تنفذت
      catch (e) {}
      //putIfAbsent// مسؤلة عن اضافة (key,value)=>Map
      //statusCode=>200 اذا العملية نجحت//
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      //if result empty => منعمل json//
      jsonResponse.putIfAbsent(
        'response',
        () => result ?? {'title': const Utf8Codec().decode(response.bodyBytes)},
      );

      return jsonResponse;
    } catch (e) {
      print(e);
      CustomToast.showMessage(
        message: e.toString(),
        messageType: MessageType.WARNING,
      );
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required RequestType requestType,
    required String url,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var request = http.MultipartRequest(
        //???qustion
        requestType.name,
        Uri.https(baseUrl, url, params),
      );
      //listOfkeys String
      var _filesKeyList = files!.keys.toList();
      //listOfvalue  String
      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }

      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();
      Map<String, dynamic> responseJson = {};
      dynamic value;

      try {
        value = await response.stream.bytesToString();
      } catch (e) {}

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent(
          'response',
          () => value is String
              ? {'title': value}
              // () => value == "" && response.statusCode == 200
              //     ? {'title': 'Register Successful!'}
              : jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

//////////////////////////////////////////////////////////////////
  static MediaType getContentType(String fileName) {
    // var fileExtension = fileName.split('.').last;
    var fileExtension = path.extension(fileName);
    var fileType;
    MediaType x;

    if (fileExtension == "png" || fileExtension == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (fileExtension == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }

  // static Map<String, MediaType> fileTypeToMediaType = {
  //   'jpeg': MediaType.parse('image/jpeg'),
  //   'png': MediaType.parse('image/png'),
  //   'pdf': MediaType.parse('application/pdf'),
  //   'doc': MediaType.parse('application/msword'),
  //   'docx': MediaType.parse('application/msword'),
  //   'xls': MediaType.parse('application/vnd.ms-excel'),
  //   'xlsx': MediaType.parse('application/vnd.ms-excel'),
  //   'unknown': MediaType.parse('application/octet-stream'),
  // };

  // static MediaType getContentType(String fileName) {
  //   var fileExtension = fileName.split('.').last;

  //   switch (fileExtension) {
  //     case 'jpg':
  //     case 'jpeg':
  //       return fileTypeToMediaType['jpeg']!;
  //     case 'png':
  //       return fileTypeToMediaType['png']!;
  //     case 'pdf':
  //       return fileTypeToMediaType['jpeg']!;
  //     case 'doc':
  //     case 'docx':
  //       return fileTypeToMediaType['doc']!;
  //     case 'xls':
  //     case 'xlsx':
  //       return fileTypeToMediaType['xls']!;
  //     default:
  //       return fileTypeToMediaType['unknown']!;
  //   }
}

// static MediaType getContentTypeTwo(String fileName) {
//   var fileExtension = fileName.split('.').last;
//   FileTypeTest? fileTypeTest;
//   switch (fileTypeTest) {
//     case FileTypeTest.JPEG:
//       break;
//     case FileTypeTest.JPG:
//       break;
//     case FileTypeTest.PNG:
//       break;
//     case FileTypeTest.PDF:
//       break;
//     case FileTypeTest.DOC:
//       break;
//     case FileTypeTest.DOCX:
//       break;
//     case FileTypeTest.XLS:
//       break;
//     case FileTypeTest.XLSX:
//       break;
//     case FileTypeTest.UNKNOWN:
//       break;
//   }
// }
// static MediaType getContentType(String fileName) {
//   var fileExtension = fileName.split('.').last;
//   if (fileExtension == "png" || fileExtension == "jpeg") {
//     return MediaType.parse("image/jpg");
//   } else if (fileExtension == 'pdf') {
//     return MediaType.parse("application/pdf");
//   } else {
//     return MediaType.parse("image/jpg");
//   }
// }

// enum FileTypeTest {
//   JPEG("image/jpg"),
//   JPG("image/jpg"),
//   PNG("image/png"),
//   PDF("application/pdf"),
//   DOC("application/msword"),
//   DOCX("application/msword"),
//   XLS("application/vnd.ms-excel"),
//   XLSX("application/vnd.ms-excel"),
//   UNKNOWN("application/octet-stream");

//   const FileTypeTest(this.value);
//   final MediaType MediaType.parse("image/jpg");
// }
