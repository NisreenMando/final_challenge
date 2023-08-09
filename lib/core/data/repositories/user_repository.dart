import 'package:dartz/dartz.dart';
import 'package:fluter_template/core/data/enums/reouest_type.dart';
import 'package:fluter_template/core/data/models/apis/token_info.dart';
import 'package:fluter_template/core/data/models/common_response.dart';
import 'package:fluter_template/core/data/network/endpoints/user_endpoints.dart';
import 'package:fluter_template/core/data/network/network_config.dart';
import 'package:fluter_template/core/utils/network_utils.dart';


class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String name,
    required String accessCode,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          requestType: RequestType.POST,
          url: UserEndpoints.login,
          headers: NetworkConfig.getHeaders(
              needAuth: false, requestType: RequestType.POST),
          body: {
            'userName': name,
            'accessCode': accessCode,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStutus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

//add //MultiPartRequest///
Future<Either<String, bool>> register({
  required String email,
  required String firstname,
  required String lastname,
  required int age,
  required String password,
  required String photoPath,
}) async {
  try {
    return NetworkUtil.sendMultipartRequest(
      requestType: RequestType.POST,
      url: UserEndpoints.register,
      fields: {
        'Email': email,
        'FirstName': firstname,
        'LastName': lastname,
        'Password': password,
        'Age': age.toString()
      },
      files: {
        'Photo': photoPath,
      },
      headers: NetworkConfig.getHeaders(
        requestType: RequestType.POST,
        needAuth: false,
        extraHeaders: {
          'Host': 'training.owner-tech.com',
          // 'Content-Type':
          //     'multipart/form-data; boundary=--------------------------641542932887345895299314',
          // 'Content-Length': '37139'
        },
      ),
    ).then(
      (response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStutus) {
          return Right(commonResponse.getStutus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      },
    );
  } catch (e) {
    return Left(e.toString());
  }
}
