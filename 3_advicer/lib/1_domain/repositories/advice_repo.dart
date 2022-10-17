

import 'package:advicer/1_domain/entities/advice_entity.dart';

abstract class AdviceRepo {
  Future<AdviceEntity> getAdviceFromDatasource();
}