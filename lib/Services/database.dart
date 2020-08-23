import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ec8/Models/period.dart';
import 'dart:async';
import 'package:ec8/Services/firestore.dart';
import 'package:ec8/Services/path.dart';

abstract class Database{
  Future <void> setPeriod(Period period);
  Future <void> deleteMonPeriod(Period period);
  Future <void> deleteTuesPeriod(Period period);
  Future <void> deleteWedPeriod(Period period);
  Future <void> deleteThursPeriod(Period period);
  Future <void> deleteFriPeriod(Period period);
  Future <void> deleteSatPeriod(Period period);
  Stream<List<Period>> periodMonStream();
  Stream<List<Period>> periodTuesStream();
  Stream<List<Period>> periodWedStream();
  Stream<List<Period>> periodThursStream();
  Stream<List<Period>> periodFriStream();
  Stream<List<Period>> periodSatStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreRepository.instance;

  @override
  Future <void> setPeriod(Period period) async {
    await _service.setData(
      path: Path.period(period.day, period.id),
      data: period.toMap(),
    );
  }


  @override
  Future <void> deleteMonPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsMonD(period.id),
    );
  }

  @override
  Future <void> deleteTuesPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsTuesD(period.id),
    );
  }

  @override
  Future <void> deleteWedPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsWedD(period.id),
    );
  }

  @override
  Future <void> deleteThursPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsThursD(period.id),
    );
  }

  @override
  Future <void> deleteFriPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsFriD(period.id),
    );
  }

  @override
  Future <void> deleteSatPeriod(Period period) async {
    await _service.deleteData(
      path: Path.periodsSatD(period.id),
    );
  }

  @override
  Stream<List<Period>> periodMonStream() =>
      _service.collectionStream(
          path: Path.periodsMon(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );

  @override
  Stream<List<Period>> periodTuesStream() =>
      _service.collectionStream(
          path: Path.periodsTues(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );

  @override
  Stream<List<Period>> periodWedStream() =>
      _service.collectionStream(
          path: Path.periodsWed(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );

  @override
  Stream<List<Period>> periodThursStream() =>
      _service.collectionStream(
          path: Path.periodsThurs(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );

  @override
  Stream<List<Period>> periodFriStream() =>
      _service.collectionStream(
          path: Path.periodsFri(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );

  @override
  Stream<List<Period>> periodSatStream() =>
      _service.collectionStream(
          path: Path.periodsSat(),
          builder: (data, documentID) => Period.fromMap(data, documentID)
      );
}