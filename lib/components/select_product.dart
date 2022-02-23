// import 'package:flutter/material.dart';

// class SelectProduct extends StatelessWidget {
//   const SelectProduct({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//                       onTap: ,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border(
//                             top: const BorderSide(color: Color(0XFFE1E1E1)),
//                             bottom: index == sampleProducts.length - 1
//                                 ? const BorderSide(color: Color(0XFFE1E1E1))
//                                 : BorderSide.none,
//                           ),
//                         ),
//                         height: 50,
//                         width: double.infinity,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 3),
//                                 child: Row(
//                                   children: [
//                                     _selected
//                                         ? SizedBox(
//                                             width: 4,
//                                             height: double.infinity,
//                                             child: RotatedBox(
//                                               quarterTurns: 3,
//                                               child: Container(
//                                                 width: 2,
//                                                 color: const Color(0XFF362852),
//                                               ),
//                                             ),
//                                           )
//                                         : const SizedBox(),
//                                     SvgPicture.asset(
//                                       svgIcons["POD"]!,
//                                       width: 25,
//                                     ),
//                                     Text(
//                                       sampleProducts[index].name,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: _selected
//                                             ? const Color(0XFF362852)
//                                             : Colors.black,
//                                         fontWeight:
//                                             _selected ? FontWeight.bold : null,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: Row(
//                                 children: [
//                                   _selected
//                                       ? SvgPicture.asset(
//                                           svgIcons["checkMark"]!,
//                                           width: 15,
//                                           color: const Color(0XFF4D2999),
//                                         )
//                                       : const SizedBox(),
//                                   Text(
//                                     " ${_selected ? ' SELECTED' : ' SELECT'}",
//                                     style: TextStyle(
//                                       fontSize: 15.5,
//                                       fontWeight: FontWeight.bold,
//                                       color: _selected
//                                           ? const Color(0XFF362853)
//                                           : const Color(0XFF4D2999),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//   }
// }