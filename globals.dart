class GlobalRoutines {

  int index;
  String routineName;
  List<double> stepTimes = [];
  List<String> stepNames = [];
  GlobalRoutines(int i, String rName, List<double> sTimes, List<String> sNames){
    index = i;
    routineName = rName;
    stepTimes = sTimes;
    stepNames = sNames;
  }
}

void globalAddRoutine(int index, String routineName, List<double> stepTimes, List<String> stepNames){
  GlobalRoutines _ = new GlobalRoutines(index, routineName, stepTimes, stepNames);
  global_routines.add(_);
}

// ignore: non_constant_identifier_names
List<GlobalRoutines> global_routines = [];
