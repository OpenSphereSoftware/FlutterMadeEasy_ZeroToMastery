import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure,AdviceEntity>> getAdvice() async {
    // call a repository to get data (failure or data)
    // proceed with business logic (manipulate the data)
    await Future.delayed(const Duration(seconds: 3), () {});
    // call to repo went good:  -> return data not failure
    // return right(const AdviceEntity(advice: 'advice to test', id: 1));
    // call to repo went bad or logic had an error -> return failure (left side)
     return left(CacheFailure());
  }
}
