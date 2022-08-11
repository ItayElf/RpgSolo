import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/nature_location.dart';
import 'package:rpgsolo/data/nature_location_data.dart';
import 'package:rpgsolo/generator/nature_location_generator.dart';
import 'package:rpgsolo/pages/views/nature_location_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateNatureLocation extends StatelessWidget {
  const GenerateNatureLocation({super.key});

  void onClick(BuildContext context, NatureLocationType? type) {
    NatureLocation location = NatureLocationGenerator.generate(type);
    Navigator.push(
      context,
      SlideRoute(
        builder: (context) => NatureLocationView(location: location),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [null, ...NatureLocationType.values];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Generator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "Choose a Location Type:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, i) => ElevatedButton(
                  onPressed: () => onClick(context, options[i]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      options[i] == null
                          ? "Random"
                          : options[i]!.name.toTitleCase(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int i) =>
                    const SizedBox(
                  height: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
