import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/data/towns/locations_type.dart';
import 'package:rpgsolo/generator/location_generator.dart';
import 'package:rpgsolo/pages/views/location_view.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GenerateLocation extends StatelessWidget {
  const GenerateLocation({super.key});

  void onClick(BuildContext context, LocationType? type) {
    Location location = LocationGenerator.generate(type);
    Navigator.push(
      context,
      SlideRoute(
        builder: (context) => LocationView(location: location),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [null, ...LocationType.values];
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
                          : options[i]!.printedName.toTitleCase(),
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
