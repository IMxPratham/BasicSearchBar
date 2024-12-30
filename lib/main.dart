import 'package:flutter/material.dart';

void main(){
  runApp(Myapp(),);
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Basic Search Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(brightness: Brightness.dark),
      ),
      home: SearchScreen(),
      );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> AllItems =[
    'Apple',
    'Banana',
    'Watermelon',
    'Mango',
    'Orange',
    'Grapes',
    'Apricot',
    'Coconut',
    'Pineapple',
    'Blueberry',
  ];
  late List<String> FilteredList;
  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState(){
    super.initState();
      FilteredList = AllItems;
  }
   void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        FilteredList = AllItems;
      } else {
        FilteredList = AllItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Basic Search Bar")),
      ),
      body:Column(
        children:[
          TextField(
            controller: _controller,
            onChanged: _filterItems, 
            decoration: InputDecoration(
              labelText: 'Search',
              border:OutlineInputBorder(),
              icon: Icon(Icons.search)
            ),
          ),
          SizedBox(
            height: 40
          ),
           Expanded(
              child: ListView.builder(
                itemCount: FilteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(FilteredList[index]),
                  );
                },
              ),
            ),
        ],
      )
    );
  }
}