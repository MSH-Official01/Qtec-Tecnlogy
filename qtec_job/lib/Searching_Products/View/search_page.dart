import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late int userId;
  bool _isSearched = false;
  var searchedData;
  var _selectedIndex = 2;
  PageController? _pageController;

  bool isLoading = false;
  int? _productIndex;

  final TextEditingController _searchController = TextEditingController();

  bool _searchBoolean = false;
  final List<int> _searchIndexList = [];
  var product = 0;

  Widget _searchTextField() {
    return TextFormField(
      controller: _searchController,
      onChanged: (String name) async {
        // Future.delayed(const Duration(seconds: 1), () async {
        //   final searchProduct = await _grocerySearchController
        //       .getGrocerySearchProduct(tokenp, name);
        //   print(name);

        //   if (searchProduct != null) {
        //     setState(() {
        //       _isSearched = true;
        //       searchedData = searchProduct;
        //       // print('searchProduct = ${searchedData[0].name}');
        //     });
        //   }
        // });
      },
      autofocus: true,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 241, 255),
        
        appBar: AppBar(
          leadingWidth: 100,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: ,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: !_searchBoolean
              ? const Text(
                  "Search",
                  style: const TextStyle(
                    color: Color(0xffFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                )
              : _searchTextField(),
          actions: !_searchBoolean
              ? [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        Future.delayed(const Duration(microseconds: 500),
                            () async {
                          _searchBoolean = true;
                        });

                        // _searchIndexList = [];

                        // Get.off(() => const GrocerySearchPage());
                      });
                    },
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                ]
              : [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          Future.delayed(const Duration(microseconds: 500),
                              () async {
                            _searchBoolean = false;
                            _isSearched = false;
                          });
                        });
                      },
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Expanded(flex: 9, child: Column())],
          ),
        ),
      ),
    );
  }
}
