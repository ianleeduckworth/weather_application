import 'package:flutter/material.dart';
import 'package:weather_application/utilities/fetch_daily.dart';
import 'package:weather_application/utilities/format_date.dart';
import 'package:weather_application/utilities/get_condition_text.dart';
import 'package:weather_application/utilities/get_weather_icon.dart';
import 'package:weather_application/utilities/get_weather_row.dart';

/// An daily view of data; is designed to show the user weather on an hour by hour basis
Widget daily(
  BuildContext context,
  Future<FetchDailyResponse> dailyData,
  String formattedCurrentDate,
) {
  return (FutureBuilder(
    future: dailyData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 16,
              columns: [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Conditions')),
                DataColumn(label: Text('Low')),
                DataColumn(label: Text('High')),
                DataColumn(label: Text('Percip %')),
              ],
              rows: List.generate(7, (index) => index).map((hourIndex) {
                // note that we can use ! here because we're inside of snapshot.hasData so we can do a null assertion
                final weatherRow = getDailyRow(
                  snapshot.data!.rawDaily,
                  hourIndex,
                );
                return DataRow(
                  color: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (weatherRow.time == formattedCurrentDate) {
                      return Colors.blue.shade50;
                    } else {
                      return null;
                    }
                  }),
                  cells: <DataCell>[
                    DataCell(Text(formatDate(weatherRow.time))),
                    DataCell(
                      Row(
                        children: [
                          getWeatherIcon(weatherRow.conditions, true),
                          SizedBox(width: 8),
                          Text(getConditionText(weatherRow.conditions)),
                        ],
                      ),
                    ),
                    DataCell(Text('${weatherRow.tempMin.round()}°')),
                    DataCell(Text('${weatherRow.tempMax.round()}°')),
                    DataCell(Text('${weatherRow.percipProb}%')),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }

      return const Center(child: CircularProgressIndicator());
    },
  ));
}
