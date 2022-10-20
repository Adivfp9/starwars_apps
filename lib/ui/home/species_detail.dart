import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_apps/Utils/widget/DetailSpec.dart';
import 'package:starwars_apps/services/providers/species/species_detail_state.dart';
import 'package:stroke_text/stroke_text.dart';

class SpeciesDetail extends StatefulWidget {
  static const routeName = '/speciesDetail';
  final String urlDetail;
  final String specId;

  const SpeciesDetail({Key? key, required this.urlDetail, required this.specId})
      : super(key: key);

  @override
  State<SpeciesDetail> createState() => _SpeciesDetailState();
}

class _SpeciesDetailState extends State<SpeciesDetail> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as SpeciesDetail;

    return ChangeNotifierProvider(
        create: (context) =>
            SpeciesDetailProvider(widget.urlDetail, widget.specId),
        child: Scaffold(body: Consumer<SpeciesDetailProvider>(
          builder: (context, state, child) {
            return SafeArea(
              child: Scaffold(
                  body: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    '${state.imgSpec}',
                                    height: double.maxFinite,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                  ),
                                  Container(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        (7 / 100),
                                    child: Column(children: [
                                      CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.red,
                                        child: CircleAvatar(
                                          radius: 50.0,
                                          backgroundImage:
                                              NetworkImage("${state.imgSpec}"),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: StrokeText(
                                              text: state.specName!,
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35,
                                                color: Colors.black,
                                              ),
                                              strokeColor: Colors.red,
                                              strokeWidth: 3,
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                (30 / 100),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Colors.black87,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  topRight:
                                                      Radius.circular(40))),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Classification",
                                                      valuesSpec: state
                                                          .specClassification!),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Designation",
                                                      valuesSpec: state
                                                          .specDesignation!),
                                                  DetailSpec(
                                                      captionSpec: "Language",
                                                      valuesSpec:
                                                          state.specLang!),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Avg Lifespan",
                                                      valuesSpec:
                                                          "${state.specavgLifespan!} years"),
                                                  DetailSpec(
                                                      captionSpec: "Avg Height",
                                                      valuesSpec:
                                                          "${state.specAvgHeight!} cm"),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Hair Color(s)",
                                                      valuesSpec: state
                                                          .specHairColors!),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Skin Color(s)",
                                                      valuesSpec: state
                                                          .specSkinColors!),
                                                  DetailSpec(
                                                      captionSpec:
                                                          "Eye Color(s)",
                                                      valuesSpec:
                                                          state.specEyeColors!),
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              50.0),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          backgroundColor:
                                                              Colors.redAccent,
                                                          fixedSize: Size(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  (70 / 100),
                                                              50),
                                                        ),
                                                        child: const Text(
                                                          "Back",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
            );
          },
        )));
  }
}
