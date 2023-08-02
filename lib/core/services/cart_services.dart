// import 'package:fluter_template/core/data/models/api/cart_model.dart';
// import 'package:fluter_template/core/data/models/api/meal_model.dart';
// import 'package:fluter_template/ui/shared/utils.dart';

// import 'package:get/get_rx/src/rx_types/rx_types.dart';

// class CartService {
//   RxList<CartModel> cartList = storage.getCartList().obs;
//   //cartCount=>//عدد القطع فقط مثلا ضفت بيتزا وشاوررما
//   RxInt cartCount = 0.obs;
//   RxDouble subTotal = 0.0.obs;
//   RxDouble tax = 0.0.obs;
//   RxDouble deliverFees = 0.0.obs;
//   RxDouble total = 0.0.obs;

//   CartService() {
//     //اذا سكرت التطبيق و ماستخدمتن بيطلع القيم صفر //
//     getCartCount();
//     calcCartTotal();
//   }
// /////////////////////////////
//   void addToCartList({
//     required MealModel mealModel,
//     required int count,
//     // count عدد نوع واحد مثل بيتزا فقط
//     Function? afterAdd,
//     //afterAdd=>  اما اظهار رسالة للمستخدم بنجاح عملية الاضافة او باخدو على صفحة تاني وبعرضلو البيانات
//   }) {
//     //mealTotal=> لحساب السعر *العدد
//     double mealTotal = calcMealTotal(count: count, mealModel: mealModel);
//     if (getCartModel(mealModel) != null) {
//       int index = getIndex(getCartModel(mealModel)!);
//       cartList[index].count = cartList[index].count! + count;
//       cartList[index].total = cartList[index].total! + mealTotal;
//     } else {
//       cartList.add(CartModel(
//         count: count,
//         total: mealTotal,
//         meal: mealModel,
//       ));
//     }
//     storage.setCartList(cartList);
//     cartCount.value = cartCount.value + count;
//     // cartCount.value += count;
//     if (afterAdd != null) afterAdd();

//     calcCartTotal();
//   }

// ///////////////////////////////////////
//   void removeFromCartList(CartModel model) {
//     cartList.remove(model);
//     cartCount.value -= model.count!;
//     // cartCount.value = cartCount.value - model.count!;

//     storage.setCartList(cartList);

//     calcCartTotal();
//   }

// /////////////////////////////////////
//   void changeCount(
//       //+ & -//
//       {required bool incress,
//       required CartModel cartModel,
//       Function? afterChange}) {
// //result=> العنصر الي بدنا نعدل عليه
//     CartModel? result = getCartModel(cartModel.meal!);

//     int index = getIndex(result!);

//     if (incress) {
//       result.count = result.count! + 1;
//       result.total = result.total! + cartModel.meal!.price!.toDouble();
//       cartCount.value += 1;
//       calcCartTotal();
//     } else {
//       if (result.count! > 1) {
//         result.count = result.count! - 1;
//         result.total = result.total! - cartModel.meal!.price!.toDouble();
//         cartCount.value -= 1;
//         calcCartTotal();
//       }
//     }

//     cartList.remove(result);
//     cartList.insert(index, result);

//     storage.setCartList(cartList);
//     if (afterChange != null) afterChange();
//   }

// ////////////////////////////////////////////////
//   void clearCart() {
//     cartList.clear();
//     cartCount.value = getCartCount();
//     calcCartTotal();

//     storage.setCartList(cartList);
//   }

//   double calcMealTotal({required MealModel mealModel, required int count}) {
//     // لحساب السعر *العدد

//     return (mealModel.price! * count).toDouble();
//   }

//   /// اذا المستخدم عمل تعديلات جديدة بتتغير حسب id الي واقفة عندو
//   /// // عم نختبر من خلالها اذا ضايفين وجبة بيتزا او لا
//   CartModel? getCartModel(MealModel mealModel) {
//     try {
//       return cartList.firstWhere(
//         (element) => element.meal!.id == mealModel.id,
//       );
//     } catch (e) {
//       return null;
//     }
//   }

// //////////////////////////////////////////////
//   ///مسؤولة عن اظهار عدد العناصر عند رمز السلة بواجهة home//
//   int getCartCount() {
//     cartCount.value = cartList.fold(
//         0, (previousValue, element) => previousValue + element.count!);

//     return cartCount.value;
//   }

// /////////////////////////////////////////
//   ///؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟
//   int getIndex(CartModel model) => cartList.indexOf(model);
// /////////////////////////////////////////////////
//   void calcCartTotal() {
//     // subTotal.value = 0.0;
//     // tax.value = 0.0;
//     // deliverFees.value = 0.0;
//     // total.value = 0.0;

//     subTotal.value = cartList.fold(
//         0, (previousValue, element) => previousValue + element.total!);
//     tax.value = subTotal.value * taxAmount;
//     deliverFees.value = (subTotal.value + tax.value) * deliverAmount;
//     // total.value=>مجموع الكلي
//     total.value = subTotal.value + deliverFees.value + tax.value;
//   }
// }
// // import 'package:project_darribne/core/data/models/api/cart_model.dart';
// // import 'package:project_darribne/core/data/models/api/meal_model.dart';
// // import 'package:project_darribne/ui/shared/utils.dart';
// // import 'package:get/get.dart';

// // class CartService {
// //   RxList<CartModel> cartList = storage.getCartList().obs;
// //   RxInt cartCount = 0.obs;
// //   RxDouble subTotal = 0.0.obs;
// //   RxDouble tax = 0.0.obs;
// //   RxDouble deliverFees = 0.0.obs;
// //   RxDouble total = 0.0.obs;

// //   CartService() {
// //     //اذا سكرت التطبيق و ماستخدمتن بيطلع القيم صفر //
// //     getCartCount();
// //     calcCartTotal();
// //   }
// //   void addToCart(
// //       {required MealModel model, required int count, Function? afterAdd}) {
// //     double mealTotal = calcMealTotal(model: model, count: count);
// //     if (getCartModel(model) != null) {
// //       int index = getIndex(getCartModel(model)!);
// //       cartList[index].count = cartList[index].count! + count;
// //       cartList[index].total = cartList[index].total! + mealTotal;
// //     } else {
// //       cartList.add(CartModel(count: count, total: mealTotal, meal: model));
// //       storage.setCartList(cartList);
// //       cartCount.value = cartCount.value + count;
// //       if (afterAdd != null) afterAdd;
// //       calcCartTotal();
// //     }
// //   }

// //   CartModel? getCartModel(MealModel model) {
// //     try {
// //       return cartList.firstWhere((element) => element.meal!.id == model.id);
// //     } catch (e) {
// //       return null;
// //     }
// //   }

// //   int getIndex(CartModel model) => cartList.indexOf(model);
// //   double calcMealTotal({required MealModel model, required int count}) {
// //     return (model.price! * count).toDouble();
// //   }

// //   void calcCartTotal() {
// //     subTotal.value = cartList.fold(
// //         0, (previousValue, element) => previousValue + element.total!);
// //     tax.value = subTotal.value * taxAmount;
// //     deliverFees.value = (subTotal.value + tax.value) * deliverAmount;
// //     total.value = subTotal.value + deliverFees.value + tax.value;
// //   }

// //   void removeFromCartList(CartModel model) {
// //     cartList.remove(model);
// //     cartCount.value = cartCount.value - model.count!;
// //     storage.setCartList(cartList);
// //     calcCartTotal();
// //   }

// //   void changeCount(
// //       {required bool increes,
// //       required CartModel model,
// //       Function? afterChange}) {
// //     CartModel? result = getCartModel(model.meal!);
// //     int index = getIndex(result!);
// //     if (increes) {
// //       result.count = result.count! + 1;
// //       result.total = result.total! + model.meal!.price!.toDouble();
// //       cartCount.value = cartCount.value + 1;
// //       calcCartTotal();
// //     } else {
// //       result.count = result.count! - 1;
// //       result.total = result.total! - model.meal!.price!.toDouble();
// //       cartCount.value = cartCount.value - 1;
// //       calcCartTotal();
// //     }
// //     cartList.remove(result);
// //     cartList.insert(index, result);
// //     storage.setCartList(cartList);
// //     if (afterChange != null) afterChange;
// //   }

// //   int getCartCount() {
// //     cartCount.value = cartList.fold(
// //         0, (previousValue, element) => previousValue + element.count!);
// //     return cartCount.value;
// //   }

// //   clearCart() {
// //     cartList.clear();
// //     cartCount.value = getCartCount();
// //     calcCartTotal();
// //     storage.setCartList(cartList);
// //   }
// // }
