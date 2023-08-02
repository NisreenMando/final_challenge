import 'package:bot_toast/bot_toast.dart';
import 'package:fluter_template/core/data/enums/operation_type.dart';
import 'package:fluter_template/core/data/enums/request_status.dart';
import 'package:fluter_template/core/utils/general_util.dart';
import 'package:fluter_template/ui/shared/utils.dart';

import 'package:get/get.dart';

class BasController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NON.obs;

  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOperationType(OperationType value) {
    operationType.value = value;
  }

  Future runFutureFunctionWithLoading(
      {required Future function,
      OperationType? type = OperationType.NON}) async {
    setRequestStatus = RequestStatus.LODAIN;
    setOperationType = type!;
    await function;
    setRequestStatus = RequestStatus.DEFAULT;
    setOperationType = OperationType.NON;
  }

  Future runFullLoadingFutuerFunction(
      {required Future function,
      OperationType? type = OperationType.NON}) async {
    checkConnection(() async {
      CustomLoader();
      //المفروض اذا مافي نت مايعمل كول على api//
      await function;
      BotToast.closeAllLoading();
    });
  }
}

Future runFullLoadingFutureFunction(
    {required Future function, OperationType? type = OperationType.NON}) async {
  CustomLoader();
  await function;
  BotToast.closeAllLoading();
}
