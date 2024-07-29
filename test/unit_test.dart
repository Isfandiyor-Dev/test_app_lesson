import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_lesson/controllers/questions_controller.dart';

void main() {
  late QuestionsController controller;

  setUp(() {
    controller = QuestionsController();
  });

  test("Tanlangan variatlarni, tanlanganlarga qo'shish", () {
    controller.addSlectedVariants(index: 0, letter: 'a');
    expect(controller.selectedVariants.length, 1);
    expect(controller.selectedVariants[0], {'index': 0, 'letter': 'a'});
  });

  test("Tanlanganalardan oxirgisini o'chirish", () {
    controller.addSlectedVariants(index: 0, letter: 'a');
    controller.removeLastSelectedVariants();
    expect(controller.selectedVariants.isEmpty, true);
  });

  test("Tanlanganlarni butunlar o'chirib tashlash", () {
    controller.addSlectedVariants(index: 0, letter: 'a');
    controller.addSlectedVariants(index: 1, letter: 'b');
    controller.addSlectedVariants(index: 4, letter: 'c');
    controller.clearSelectedVariants();
    expect(controller.selectedVariants.isEmpty, true);
  });

  test("Keyingi savolga o'tish", () {
    controller.addSlectedVariants(index: 0, letter: 'a');
    controller.addSlectedVariants(index: 1, letter: 'b');

    controller.nextQuestion();

    expect(controller.selectedVariants.isEmpty, true);
    expect(controller.currentQuestionIndex, 1);
  });

  test("O'yinni qayta boshalash", () {
    controller.nextQuestion();
    controller.restartGame();
    expect(controller.currentQuestionIndex, 0);
  });

  test("Savol variatlarini olish", () {
    List<String> variants = controller.getVariants();
    expect(variants.length, 12);
  });
}
