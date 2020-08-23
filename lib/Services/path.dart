import 'package:flutter/material.dart';

class Path {
  static String period(String todayDay, String className) => 'Data/Period/$todayDay/$className';
  static String periodsMon() => 'Data/Period/Monday';
  static String periodsTues() => 'Data/Period/Tuesday';
  static String periodsWed() => 'Data/Period/Wednesday';
  static String periodsThurs() => 'Data/Period/Thursday';
  static String periodsFri() => 'Data/Period/Friday';
  static String periodsSat() => 'Data/Period/Saturday';
  static String periodsMonD(String className) => 'Data/Period/Monday/$className';
  static String periodsTuesD(String className) => 'Data/Period/Tuesday/$className';
  static String periodsWedD(String className) => 'Data/Period/Wednesday/$className';
  static String periodsThursD(String className) => 'Data/Period/Thursday/$className';
  static String periodsFriD(String className) => 'Data/Period/Friday/$className';
  static String periodsSatD(String className) => 'Data/Period/Saturday/$className';

}