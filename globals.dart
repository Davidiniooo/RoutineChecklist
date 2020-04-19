class GlobalRoutine {

  int index;
  String routineName;
  List<double> stepTimes = [];
  List<String> stepNames = [];
  GlobalRoutine(int i, String rName, List<double> sTimes, List<String> sNames){
    index = i;
    routineName = rName;
    stepTimes = sTimes;
    stepNames = sNames;
  }
}



class ListGlobalRoutines{
  int currentIndex = 0;
  List<GlobalRoutine> globalRoutines = [];

  void globalAddRoutine(String routineName, List<double> stepTimes, List<String> stepNames){
    GlobalRoutine _ = new GlobalRoutine(currentIndex, routineName, stepTimes, stepNames);
    globalRoutines.add(_);
    currentIndex++;
  }
}
// ignore: non_constant_identifier_names
ListGlobalRoutines GLOBAL_LIST_ROUTINES = new ListGlobalRoutines();



