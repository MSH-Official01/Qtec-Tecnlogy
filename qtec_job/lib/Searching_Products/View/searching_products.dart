import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Controllar/search_controllar.dart';
class SearchingProducts extends StatefulWidget {
  const SearchingProducts({super.key});

  @override
  State<SearchingProducts> createState() => _SearchingProductsState();
}

class _SearchingProductsState extends State<SearchingProducts> {
  final TextEditingController _searchController = TextEditingController();
  final SearchController _grocerySearchController = Get.put(SearchController());
  HomeController _homeController = Get.put(HomeController());

  var searchedData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchItmes();
  }

  getSearchItmes() async {
    final searchProduct = await _grocerySearchController.getSearchProduct(
        _homeController.tokenGlobal, _searchController.text);

    if (searchProduct != null) {
      setState(() {
        searchedData = searchProduct as List;
      });
    }
  }

  Widget _searchTextField() {
    return TextFormField(
      controller: _searchController,
      onChanged: (_) async {
        final searchProduct = await _grocerySearchController.getSearchProduct(
            _homeController.tokenGlobal, _searchController.text);

        if (searchProduct != null) {
          setState(() {
            searchedData = searchProduct as List;
          });
        } else {
          Text("No Data");
        }
      },
      autofocus: true,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
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
  dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 228, 241, 255),
          appBar: AppBar(
            // leadingWidth: 100,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            // leading: IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(Icons.arrow_back_ios)),
            title: _searchTextField(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                searchedData != null
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 10),
                        itemCount: searchedData.length,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: .79,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          // color: Colors.red,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38, //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 1, // blur radius
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              )
                            ],
                          ),

                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => SeeAllProductsScreen(
                              //                           title: productItem.title,
                              //                           id: productItem.id
                              //                               .toString(),
                              //   )),
                              // );
                            },
                            child: Column(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 5, vertical: 5),
                                //   child: Image.network(
                                //     '${Appurl.baseURL}${searchedData[index].image}',
                                //     fit: BoxFit.contain,
                                //     height: 180,
                                //     width: 170,
                                //   ),
                                // ),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${searchedData[index]["products"]["results"]["brand"]["name"].toString()}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: _size.width * .2,
                                        child: Text(
                                          searchedData[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // GroceryCount(
                                //   index: 0,
                                //   price: 100,
                                //   productId: 0,
                                // )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: _size.height * .4,
                          ),
                          Center(child: Text('Search your product')),
                        ],
                      )
              ],
            ),
          ),
        ));
  }
}

//   Future<SecialSearch> fetchSecialSearch() async {
//     final response = await http.get(Uri.parse(
//         "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice"));

//     if (response.statusCode == 200) {
//       return SecialSearch.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }

//   late Future<SecialSearch> secialSearch;

//   @override
//   void initState() {
//     super.initState();
//     secialSearch = fetchSecialSearch();
//     // print(secialSearch);
//   }

// //          getGrocerySearchProduct() async {
//     try {
//       var url =
//           "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";
//       // var url = Appurl.baseURL + "api/groceries/search";

//       http.Response response = await http.get(Uri.parse(url));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         var secialSearch = secialSearchFromJson(response.body);

//         print(
//             'proooooooooooooooooooo ${secialSearch.data.products.results.length}');
//         // // print(marketCategory.data[1].categoryName);
//         return secialSearch.data;
//       } else {
//         print('User not found');
//       }
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   secialSearch = getGrocerySearchProduct();
//   // }
// }
// }
