import 'package:advicer/1_domain/entities/advice_entity.dart';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    // call a repository to get data (failure or data)
    // proceed with business logic (manipulate the data)
    await Future.delayed(const Duration(seconds: 3), () {});
    return const AdviceEntity(advice: 'advie to test', id: 1);
  }
}
