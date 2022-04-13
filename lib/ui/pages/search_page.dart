// import 'package:airplane/shared/theme.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final List<Map<String, dynamic>> _allUsers = [
//     {
//       "id": 1,
//       "name": "dr. Adam",
//       "spesialis": "Dokter Umum",
//       "imageUrl": 'assets/image_doctor1.jpg',
//       "rating": 4.9.toDouble(),
//       "price": 27.toDouble(),
//     },
//     {
//       "id": 2,
//       "name": "dr. Albert Sp.PD",
//       "spesialis": "Spesialis Penyakit Dalam",
//       "imageUrl": 'assets/image_doctor2.jpg',
//       "rating": 4.9.toDouble(),
//       "price": 12.toDouble(),
//     },
//     {
//       "id": 3,
//       "name": "dr. Natasha Sp.THT",
//       "spesialis": "Spesialis THT",
//       "imageUrl": 'assets/image_doctor3.jpg',
//       "rating": 4.8.toDouble(),
//       "price": 17.toDouble(),
//     },
//     {
//       "id": 4,
//       "name": "dr. Indah Sp.U",
//       "spesialis": "Spesialis Urologi",
//       "imageUrl": 'assets/image_doctor4.jpg',
//       "rating": 4.8.toDouble(),
//       "price": 9.toDouble(),
//     },
//     {
//       "id": 5,
//       "name": "dr. Citra Sp.BF",
//       "spesialis": "Spesialis Bedah Saraf",
//       "imageUrl": 'assets/image_doctor5.jpg',
//       "rating": 4.5.toDouble(),
//       "price": 8.toDouble(),
//     },
//     {
//       "id": 6,
//       "name": "dr. Fajar Sp.B",
//       "spesialis": "Spesialis Bedah",
//       "imageUrl": 'assets/image_doctor6.jpeg',
//       "rating": 4.4.toDouble(),
//       "price": 21.toDouble(),
//     },
//     {
//       "id": 7,
//       "name": "dr. Marsya Sp.KJ",
//       "spesialis": "Spesialis Kedokteran Jiwa",
//       "imageUrl": 'assets/image_doctor7.png',
//       "rating": 4.3.toDouble(),
//       "price": 18.toDouble(),
//     },
//     {
//       "id": 8,
//       "name": "dr. Dinda Sp.M",
//       "spesialis": "Spesialis Mata",
//       "imageUrl": 'assets/image_doctor8.png',
//       "rating": 4.4.toDouble(),
//       "price": 7.toDouble(),
//     },
//   ];

//   List<Map<String, dynamic>> _foundUsers = [];
//   @override
//   initState() {
//     _foundUsers = _allUsers;
//     super.initState();
//   }

//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = _allUsers;
//     } else {
//       results = _allUsers
//           .where((user) =>
//               user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       _foundUsers = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               margin: EdgeInsets.symmetric(
//                 horizontal: defaultMargin,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: kWhiteColor,
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.search_rounded,
//                     color: kGreyColor,
//                     size: 36.0,
//                   ),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (value) => _runFilter(value),
//                       style: greyTextStyle,
//                       decoration: InputDecoration.collapsed(
//                         hintText: 'Find a Magical Place',
//                         hintStyle: greyTextStyle,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Expanded(
//               child: _foundUsers.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _foundUsers.length,
//                       padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//                       itemBuilder: (context, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DetailPage(
//                                     imageUrl: _foundUsers[index]['imageUrl'],
//                                     name: _foundUsers[index]['name'],
//                                     rating: _foundUsers[index]["rating"],
//                                     price: _foundUsers[index]['price'],
//                                     spesialis: _foundUsers[index]['spesialis'],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               padding: EdgeInsets.all(10),
//                               margin: EdgeInsets.only(top: 14),
//                               decoration: BoxDecoration(
//                                 color: kWhiteColor,
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 70,
//                                     height: 70,
//                                     margin: EdgeInsets.only(right: 16),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(18),
//                                       image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                           _foundUsers[index]['imageUrl'],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           _foundUsers[index]['name'],
//                                           style: blackTextStyle.copyWith(
//                                             fontSize: 18,
//                                             fontWeight: medium,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           _foundUsers[index]['spesialis'],
//                                           style: greyTextStyle.copyWith(
//                                             fontWeight: light,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: 20,
//                                         width: 20,
//                                         margin: EdgeInsets.only(
//                                           right: 2,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                               'assets/icon_star.png',
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Text(
//                                         _foundUsers[index]['rating'].toString(),
//                                         style: blackTextStyle.copyWith(
//                                           fontWeight: medium,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ))
//                   : Center(
//                       child: Text(
//                         'No results found',
//                         style: greyTextStyle.copyWith(
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
