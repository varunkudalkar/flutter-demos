import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:third_flutter_app/define_term_response.dart';
import 'package:third_flutter_app/term.dart';

class NetworkingService {
  Future<List<Term>> defineTerm(String searchTerm) async {
    final queryParameters = {'term': searchTerm};
    final uri = Uri.https('mashape-community-urban-dictionary.p.rapidapi.com',
        'define', queryParameters);
    final headers = {
      "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com",
      "x-rapidapi-key": "d687496d86msh6eb9d35ae436580p146e17jsn09da200c2fb8",
    };
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final defineTermResponse =
          DefineTermResponse.fromJson(jsonDecode(response.body));
      return defineTermResponse.list;
    } else {
      throw Exception('Failed to define term');
    }
  }
}
