// class RandomTables extends StatelessWidget {
//   const RandomTables({
//     super.key,
//     required this.appState,
//   });
//
//   final AppState appState;
//
//   @override
//   Widget build(BuildContext context) {
//     List<RandomTableEntry> randomTables = appState.randomTables;
//     return WrapManager(
//       wrapControls: appState.wrapControls,
//       children: [
//         ...randomTables.map(
//           (table) => RandomTableButton(appState: appState),
//         ),
//       ],
//     );
//   }
// }

// class RandomTableButton extends StatelessWidget {
//   const RandomTableButton({
//     super.key,
//     required this.appState,
//   });
//
//   final AppState appState;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListButton(
//       label: table.title,
//       onPressed: () {
//         RollTableResult? result = rollTable(table);
//         appState.addRandomTableResultsEntry(result!);
//       },
//       onLongPress: () {
//       },
//     );
//   }
// }
