import 'term.dart';

class DefineTermResponse {
  DefineTermResponse({this.list});
  List<Term> list;

  factory DefineTermResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] is List) {
      final list = json['list'] as List;
      final objectList = list.cast<Map<String, dynamic>>();
      final termsList = objectList.map((e) => Term.fromJson(e));

      return DefineTermResponse(list: termsList.toList());
    } else {
      throw Exception('No list response');
    }
  }
}
