import 'package:flutter/material.dart';
import 'package:third_flutter_app/networking_service.dart';
import 'package:third_flutter_app/term.dart';
import 'package:third_flutter_app/term_details_page.dart';
import 'package:third_flutter_app/terms_page.dart';
import 'enter_term_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _searchedTerm;
  Term _selectedTerm;
  List<Term> _terms = [];

  final _networkingService = NetworkingService();

  void searchForTerm(String term) async {
    final terms = await _networkingService.defineTerm(term);

    setState(() {
      this._searchedTerm = term;
      this._terms = terms;
      print(term);
    });
  }

  void _didSelectTerm(Term term) {
    setState(() {
      this._selectedTerm = term;
      print(term);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Dictionary App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              key: EnterTermPage.valueKey,
              child: EnterTermPage(
                searchForTerm: searchForTerm,
              )),
          if (_searchedTerm != null && _searchedTerm.isNotEmpty)
            MaterialPage(
                key: TermsPage.valueKey,
                child: TermsPage(
                  title: _searchedTerm,
                  terms: this._terms,
                  didSelectTerm: _didSelectTerm,
                )),
          if (_selectedTerm != null)
            MaterialPage(
                key: TermDetailsPage.valueKey,
                child: TermDetailsPage(
                  term: _selectedTerm,
                ))
        ],
        onPopPage: (route, result) {
          final materialPage = route.settings as MaterialPage;
          final pageKey = materialPage.key;

          if (pageKey == TermsPage.valueKey) {
            this._searchedTerm = null;
          }

          if (pageKey == TermDetailsPage.valueKey) {
            this._selectedTerm = null;
          }
          return route.didPop(result);
        },
      ),
    );
  }
}
