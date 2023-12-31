import 'dart:convert';


class CartModel {
  int? count;
  double? total;
 // MealModel? meal;

  CartModel({this.count, this.total,
 //  this.meal
   });

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    //?????????????
   // meal = json['meal'] != null ?  MealModel.fromJson(json['meal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    //???????????
   // if (this.meal != null) 
    {
//data['meal'] = this.meal!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      'count': model.count,
      'total': model.total,
      //'meal': model.meal,
    };
  }
//string<=list مرقنا
  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
            .toList(),
      );
//list<=String مرقنا
  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}