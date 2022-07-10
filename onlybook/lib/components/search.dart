import 'dart:html';

import 'package:flutter/material.dart';
import 'package:onlybook/mp.dart';


class DataSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?Books.books:Books.books;
    
  }
}