import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int id}) : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['advice'], id: json['advice_id']);
  }
}

class EmployeeEntity {
  final int rn;
  final int empno;
  final String job;
  final String ename;
  // for uri you need a own class as you have the ref header

  EmployeeEntity({
    required this.rn,
    required this.empno,
    required this.job,
    required this.ename,
  });
}

class EmployeeModel extends EmployeeEntity {
  EmployeeModel({
    required rn,
    required empno,
    required job,
    required ename,
  }) : super(rn: rn, empno: empno, job: job, ename: ename);

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(rn: json['rn'], empno: json['empno'], ename: json['ename'], job: json['json']);
  }
}

class EmployeeListEntity {
  final List<EmployeeEntity> items;

  EmployeeListEntity({required this.items});
}

class EmployeeListModel extends EmployeeListEntity {
  EmployeeListModel({required List<EmployeeEntity> items}) : super(items: items);

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) {
    return EmployeeListModel(items: json['items']);
  }
}
