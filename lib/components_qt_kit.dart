library quadrant_components;

export 'src/quadrant_requests.dart';

class ClassTeste {
  String teste1({required int val}){
    if(val > 6) return "Passou";
    if(val > 0) return "Reprovado";
    return "error";
  }
}
