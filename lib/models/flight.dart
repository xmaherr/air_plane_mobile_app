class FlightModel {
  int _id;
  String _from;
  String _to;
  DateTimeData _departureDate;
  DateTimeData _returnDate;
  ClassOfFlight _classOfFlight;
  int _capacity;

  FlightModel(
      this._id,
      this._from,
      this._to,
      this._departureDate,
      this._returnDate,
      this._classOfFlight,
      this._capacity,
      );

  int get id => _id;
  set id(int value) => _id = value;

  String get from => _from;
  set from(String value) => _from = value;

  String get to => _to;
  set to(String value) => _to = value;

  DateTimeData get departureDate => _departureDate;
  set departureDate(DateTimeData value) => _departureDate = value;

  DateTimeData get returnDate => _returnDate;
  set returnDate(DateTimeData value) => _returnDate = value;

  ClassOfFlight get classOfFlight => _classOfFlight;
  set classOfFlight(ClassOfFlight value) => _classOfFlight = value;

  int get capacity => _capacity;
  set capacity(int value) => _capacity = value;
}

class DateTimeData {
  final DateTime dateTime;

  DateTimeData({required this.dateTime});
}

enum ClassOfFlight {
  economy,
  business,
  firstClass,
}