import 'package:flutter/material.dart';
import 'package:flight_core_models_library/flight_core_models_library.dart';
import 'package:flight_translations_library/flight_translations_library.dart';

class FlightDisplay extends StatelessWidget {
  final FlightDetails flightDetails;
  FlightDisplay({@required this.flightDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${AppLocalizations.of(context).translate('label_airline')}: ${flightDetails.airline}'),
          Text('${AppLocalizations.of(context).translate('label_flight_number')}: ${flightDetails.flightNumber}'),
          Text('${AppLocalizations.of(context).translate('label_departure_date')}: ${flightDetails.departureDate}'),
        ],
      ),
    );
  }
}
