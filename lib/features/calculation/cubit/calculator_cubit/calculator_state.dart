part of 'calculator_cubit.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

final class CalculatorInitial extends CalculatorState {}

class CalculatorInputChanged extends CalculatorState {
  final String expression;

  const CalculatorInputChanged(this.expression);
}
class CalculatorResult extends CalculatorState {
  final String result;

  const CalculatorResult(this.result);
}
class CalculatorError extends CalculatorState {
  final String message;

  const CalculatorError(this.message);

}
