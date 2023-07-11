import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class AutosuggestionTextField extends StatefulWidget {
  @override
  _AutosuggestionTextFieldState createState() => _AutosuggestionTextFieldState();
}

class _AutosuggestionTextFieldState extends State<AutosuggestionTextField> {
  TextEditingController? searchTextFieldController; // Change the type to TextEditingController

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List<String> suggestions = [
    'Syed',
    'Parashot',
    'Nawaz',
  ];

  String? selectedSuggestion = '';

  @override
  void initState() {
    super.initState();
    searchTextFieldController = TextEditingController(); // Initialize the TextEditingController
  }

  @override
  void dispose() {
    searchTextFieldController?.dispose(); // Dispose of the TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField<String>(
      controller: searchTextFieldController, // Assign the TextEditingController to the controller parameter
      key: key,
      decoration: InputDecoration(
        hintText: selectedSuggestion == '' ?'Search' : selectedSuggestion,
      ),
      suggestions: suggestions,
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        setState(() {
          selectedSuggestion = item;
        });
      },
      itemBuilder: (context, item) {
        return ListTile(
          title: Text(item),
        );
      },
    );
  }
}
