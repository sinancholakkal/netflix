import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/domain/search/get_api_function/get_api_function.dart';
import 'package:netflix/domain/search/search_resp/search_resp.dart';
import 'package:netflix/presentation/search/widget/search_idl.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  ValueNotifier<String?> ss = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onSubmitted: (value) async {
                ss.value = value;
                await getSearchResult(value);
              },
              // onSuffixTap: () {
              //   ss.value = null;
              //   searchResultNotifier.value = []; // Clear previous results
              // },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            kHeight,
            ValueListenableBuilder<String?>(
              valueListenable: ss,
              builder: (BuildContext context, value, Widget? child) {
                if (value == null || value.isEmpty) {
                  return const Expanded(child: SearchIdlWidget());
                } else {
                  return Expanded(
                    child: ValueListenableBuilder<List<SearchResultData>>(
                      valueListenable: searchResultNotifier,
                      builder: (context, results, _) {
                        if (results.isEmpty) {
                          return  Center(
                            child: FutureBuilder(
                              future: Future.delayed(const Duration(milliseconds: 700),()=>searchResultNotifier.value),
                              builder: (context,snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(child: CircularProgressIndicator(),);
                                }
                                return Text(
                                  "No results found",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                );
                              }
                            ),
                          );
                        } else {
                          print("data here kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                          return const SearchResultWidget();
                        }
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:netflix/core/constant/constant.dart';
// import 'package:netflix/domain/search/get_api_function/get_api_function.dart';
// import 'package:netflix/domain/search/search_resp/search_resp.dart';
// import 'package:netflix/presentation/search/widget/search_idl.dart';
// import 'package:netflix/presentation/search/widget/search_result.dart';
// ValueNotifier<String?> ss = ValueNotifier(null);
// class ScreenSearch extends StatelessWidget {
//   ScreenSearch({super.key});
//  // ValueNotifier<String?> ss = ValueNotifier(null);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CupertinoSearchTextField(
//               onSubmitted: (value) async{
//                 ss.value = value;
//                 ss.notifyListeners();
//                 await getSearchResult(value);
//               },
//               // onSuffixTap: (){
//               //   ss.value = null;
//               // },
//               backgroundColor: Colors.grey.withOpacity(0.4),
//               prefixIcon: const Icon(
//                 Icons.search,
//                 color: Colors.grey,
//               ),
//               suffixIcon: const Icon(
//                 CupertinoIcons.xmark_circle_fill,
//                 color: Colors.grey,
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//             kHeight,
//             ValueListenableBuilder(
//               valueListenable: ss, builder: (BuildContext context, value, Widget? child) { 
//                 if(value ==null){
//                   return Expanded(child: const SearchIdlWidget());
//                 }else{
//                   return Expanded(child: const SearchResultWidget());
//                 }
//                },
              
//             )
//             //Expanded(child: const SearchIdlWidget())
//             //Expanded(child: const SearchResultWidget()),
//           ],
//         ),
//       )),
//     );
//   }
// }
