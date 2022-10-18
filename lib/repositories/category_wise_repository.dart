import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/category_wise_response.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

class CategoryWiseRepository {

  Future<CategoryWiseModel> getAllCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/categorized");
    final response =
    await http.get(url,headers: {
      "App-Language": app_language.$,
    });
    print("${AppConfig.BASE_URL}/categorized");
    print(response.body.toString());
    return categoryWiseModelFromJson(response.body);
  }

}
