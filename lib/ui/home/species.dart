import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:starwars_apps/models/species/species_result.dart';
// import 'dart:math' as math;
import 'package:starwars_apps/services/providers/species/species_state.dart';

class SpeciesPage extends StatelessWidget {
  const SpeciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpeciesProvider(),
      child: Consumer<SpeciesProvider>(
        builder: (context, state, child) {
          // print(state.dataState);
          // switch (state.dataState) {
          //   case DataState.Uninitialized:
          //     Future(() {
          //       state.fetchData(isRefresh: true);
          //     });
          //     return SpeciesListView(state.speciesList, false, state.dataState);
          //   case DataState.Initial_Fetching:
          //   case DataState.More_Fetching:
          //     return SpeciesListView(state.speciesList, true, state.dataState);
          //   case DataState.Refreshing:
          //     return SpeciesListView(state.speciesList, true, state.dataState);
          //   case DataState.Fetched:
          //   case DataState.Error:
          //   case DataState.No_More_Data:
          //     return SpeciesListView(state.speciesList, false, state.dataState);
          // }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: const Text("StarWars Species"),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         // state.fetchData();
              //       },
              //       icon: const Icon(Icons.refresh))
              // ],
            ),
            body: Column(
              children: [
                Container(
                  height: 50.0,
                  color: Colors.green,
                  child: Center(
                    child: Text(state.nextPage!),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: state.scrollController,
                      padding: const EdgeInsets.only(bottom: 100.0),
                      scrollDirection: Axis.vertical,
                      itemCount: state.speciesList.length + 1,
                      itemBuilder: (context, idx) {
                        if (idx == state.speciesList.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Opacity(
                                opacity: state.isLoading ? 1.0 : 00,
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                          );
                        } else {
                          return Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Text(
                                  (idx + 1).toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(state.speciesList[idx].name!),
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class SpeciesListView extends StatelessWidget {
//   const SpeciesListView(
//       List<SpeciesResult> speciesList, bool isLoading, DataState dataState,
//       {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SpeciesProvider>(builder: (context, cstate, child) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.redAccent,
//           title: Text("StarWars Species ${cstate.totalData}"),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   // state.fetchData();
//                 },
//                 icon: const Icon(Icons.refresh))
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: NotificationListener<ScrollNotification>(
//               onNotification: (notification) =>
//                   cstate.scrollNotification(notification),
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   await cstate.onRefresh();
//                 },
//                 child: ListView.builder(
//                     padding: const EdgeInsets.only(bottom: 200.0),
//                     scrollDirection: Axis.vertical,
//                     itemCount: cstate.speciesList.length,
//                     itemBuilder: (context, idx) => Card(
//                           elevation: 6,
//                           margin: const EdgeInsets.all(10),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.red,
//                               child: Text(
//                                 (idx + 1).toString(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             title: Text(cstate.speciesList[idx].name!),
//                           ),
//                         )),
//               ),
//             )),
//             if (cstate.dataState == DataState.More_Fetching)
//               const Center(child: CircularProgressIndicator()),
//           ],
//         ),
//       );
//     });
//   }
// }
