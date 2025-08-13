import 'package:flutter/material.dart';
import 'package:weather_application/utilities/fetch_hourly.dart';
import 'package:weather_application/utilities/get_condition_text.dart';
import 'package:weather_application/utilities/get_weather_icon.dart';
import 'package:weather_application/utilities/get_weather_row.dart';

/// An hourly view of data; is designed to show the user weather on an hour by hour basis
Widget hourly(
  BuildContext context,
  Future<FetchHourlyResponse> hourlyData,
  int hourIndex,
) {
  return (FutureBuilder(
    future: hourlyData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return SingleChildScrollView(
          child: DataTable(
            columnSpacing: 16,
            columns: const <DataColumn>[
              DataColumn(label: Text('Time')),
              DataColumn(label: Text('Conditions')),
              DataColumn(label: Text('Temp')),
              DataColumn(label: Text('Percip')),
              DataColumn(label: Text('%')),
              DataColumn(label: Text('Dew Pt')),
            ],
            rows: List.generate(24, (index) => index).map((rowHourIndex) {
              // note that we can use ! here because we're inside of snapshot.hasData so we can do a null assertion
              final weatherRow = getHourlyRow(
                snapshot.data!.rawHourly,
                rowHourIndex,
              );
              return DataRow(
                color: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (rowHourIndex == hourIndex) {
                    return Colors.blue.shade50;
                  } else {
                    return null;
                  }
                }),
                cells: <DataCell>[
                  DataCell(Text(weatherRow.time.split('T')[1])),
                  DataCell(
                    Row(
                      children: [
                        getWeatherIcon(
                          weatherRow.conditions,
                          rowHourIndex >= 6 && rowHourIndex <= 18,
                        ),
                        SizedBox(width: 8),
                        Text(getConditionText(weatherRow.conditions)),
                      ],
                    ),
                  ),
                  DataCell(Text('${weatherRow.temp}°')),
                  DataCell(Text('${weatherRow.precipAmount.toString()} in')),
                  DataCell(Text('${weatherRow.percipPercent}%')),
                  DataCell(Text('${weatherRow.dewPoint}°')),
                ],
              );
            }).toList(),
          ),
        );
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }

      return const Center(child: CircularProgressIndicator());
    },
  ));
}
