part of 'navigation_todo_cubit.dart';

class NavigationToDoCubitState extends Equatable {
  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyDisplayed;

  const NavigationToDoCubitState({
    this.isSecondBodyDisplayed,
    this.selectedCollectionId,
  });

  @override
  List<Object?> get props => [isSecondBodyDisplayed, selectedCollectionId];
}
