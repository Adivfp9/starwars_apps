import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_apps/services/providers/species/species_state.dart';
import 'package:starwars_apps/ui/home/species_detail.dart';

class SpeciesPage extends StatelessWidget {
  static const routeName = '/speciesDetail';

  const SpeciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpeciesProvider(),
      child: Consumer<SpeciesProvider>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: const Text("StarWars Species"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: state.scrollController,
                      padding: const EdgeInsets.only(bottom: 50.0),
                      scrollDirection: Axis.vertical,
                      itemCount: state.speciesList.length,
                      itemBuilder: (context, idx) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SpeciesDetail.routeName,
                                arguments: SpeciesDetail(
                                    urlDetail: state.speciesList[idx].url!,
                                    specId: (idx + 1).toString()));
                          },
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(7),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${state.imgSource}${(idx + 1).toString()}.jpg'),
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(state.speciesList[idx].name!),
                              subtitle:
                                  Text(state.speciesList[idx].classification!),
                            ),
                          ),
                        );
                      }),
                ),
                state.isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Opacity(
                            opacity: state.isLoading ? 1.0 : 00,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : const Text("")
              ],
            ),
          );
        },
      ),
    );
  }
}
