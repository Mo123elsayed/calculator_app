import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());

  String _expression = '';

  void addCharacter(String char) {
    _expression += char;
    emit(CalculatorInputChanged(_expression));
  }

  void clear() {
    _expression = '';
    emit(CalculatorInputChanged(_expression));
  }

  void calculate() {
    try {
      final result = _evaluateExpression(_expression);
      _expression = result.toString();
      emit(CalculatorResult(_expression));
    } catch (e) {
      emit(const CalculatorError('Invalid Expression'));
    }
  }

  double _evaluateExpression(String expression) {
    List<String> parts = expression.split(RegExp(r'([+\-*/])'));
    if (parts.length < 3) return double.tryParse(parts[0]) ?? 0;

    double num1 = double.parse(parts[0]);
    String operator = expression.replaceAll(RegExp(r'[^+\-*/]'), '');
    double num2 = double.parse(parts[2]);

    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num2 != 0 ? num1 / num2 : double.nan;
      default:
        return 0;
    }
  }
}
