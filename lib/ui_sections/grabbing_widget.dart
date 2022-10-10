// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GrabbingWidget extends StatelessWidget {
  GrabbingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Column(
              //   children:  [
              //     Text(
              //       "1",
              //       style: TextStyle(
              //           color: Colors.grey[700],
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(
              //       height: 6,
              //     ),
              //     const Text(
              //       "Total Items",
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 8,
              //           fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.circleChevronDown,
                    color: Colors.black,
                    size: 25,
                  ),
                  // const SizedBox(
                  //   height: 13,
                  // ),
                  Container(
                    width: 80,
                    height: 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10)
                        .copyWith(bottom: 0),
                  )
                ],
              ),
              // Column(
              //   children: [
              //     Icon(
              //       FontAwesomeIcons.trash,
              //       color: Colors.grey[700],
              //       size: 20,
              //     ),
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     const Text(
              //       "Clear Cart",
              //       style: TextStyle(color: Colors.grey, fontSize: 8),
              //     ),
              //   ],
              // )
            ],
          ),
          // Container(
          //   color: Colors.grey[300],
          //   height: 2,
          // )
        ],
      ),
    );
  }
}
