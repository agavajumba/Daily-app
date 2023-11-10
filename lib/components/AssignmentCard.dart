import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      height: 72,
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 246, 255, 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 32,
            color: Color.fromRGBO(11, 189, 109, 1),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Koneksi dengan firebase",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Deadline 29 july 2021",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
