/// Gets the current hour as an index between 0 and 24
int getHourIndex() {
  final now = DateTime.now();
  return now.hour;
}