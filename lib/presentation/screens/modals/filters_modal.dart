// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pokemon_redo/constants/app_lists.dart';
// import 'package:pokemon_redo/constants/app_strings.dart';

// class FiltersModal extends ConsumerWidget {
//   const FiltersModal({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final filters =

//     return Column(
//       children: [
//         SizedBox(height: 25),
//         Text(
//           AppStrings.kFiltraPorPrefs,
//           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 40),
//         Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.only(left: 20),
//           child: Text(
//             'Tipo',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//         ),
//         Divider(),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: AppLists.tipos.length,
//             itemBuilder: (context, index) => CheckboxListTile(
//               title: Text(AppLists.tipos[index]),
//               value: filters[index],
//               onChanged: (value) {
//                 //    ref.read(filtersProvider.notifier).toggle(index);
//               },
//             ),
//           ),
//         ),
//         Divider(),
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 15),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white,
//               backgroundColor: Colors.blue,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text(AppStrings.kAplicar),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 15),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.black,
//               backgroundColor: Colors.white,
//             ),
//             onPressed: () {
//               //    ref.read(filtersProvider.notifier).clearFilters();
//               Navigator.of(context).pop();
//             },
//             child: Text(AppStrings.kCancelar),
//           ),
//         ),
//       ],
//     );
//   }
// }

// List<bool> filters = List.filled(AppLists.tipos.length, false);

  // void toggleTile(int index) {
  //   setState(() {
  //     filters[index] = !filters[index];
  //   });
  // }