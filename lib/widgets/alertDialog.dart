// import 'package:flutter/material.dart';

// class CustomAlertDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }

//   Future<void> _showMyDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('This is a demo alert dialog.'),
//                 Text('Would you like to approve of this message?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Approve'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//   /*showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('AlertDialog Tilte'),
//         content: const Text('AlertDialog description'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'Cancel'),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'OK'),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     ); */
// }
