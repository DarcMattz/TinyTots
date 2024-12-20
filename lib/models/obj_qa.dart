import 'package:tinytots/gen/assets.gen.dart';

class QuestionAnswer {
  final String question;
  final String answer;
  final String questionSoundPath;
  final String answerSoundPath;
  final String hintPath;

  QuestionAnswer({
    required this.question,
    required this.answer,
    this.questionSoundPath = "",
    this.answerSoundPath = "",
    this.hintPath = "",
  });
}

final List<QuestionAnswer> questionAnswers = [
  QuestionAnswer(
    question: "Part of the body that can hold things.",
    answer: "hand",
    questionSoundPath: "sounds/explore/hands_question.m4a",
    answerSoundPath: "sounds/explore/hands.m4a",
    hintPath: Assets.images.explore.clue.hand.path,
  ),
  QuestionAnswer(
    question: "A container to carry water when you are outside.",
    answer: "bottle",
    questionSoundPath: "sounds/explore/bottle_question.m4a",
    answerSoundPath: "sounds/explore/bottle.m4a",
    hintPath: Assets.images.explore.clue.bottle.path,
  ),
  QuestionAnswer(
    question: "An object placed on a wall to tell the time.",
    answer: "clock",
    questionSoundPath: "sounds/explore/clock_question.m4a",
    answerSoundPath: "sounds/explore/clock.m4a",
    hintPath: Assets.images.explore.clue.clock.path,
  ),
  QuestionAnswer(
    question: "Part of the body that helps you walk.",
    answer: "foot",
    questionSoundPath: "sounds/explore/feet_question.m4a",
    answerSoundPath: "sounds/explore/feet.m4a",
    hintPath: Assets.images.explore.clue.foot.path,
  ),
  QuestionAnswer(
    question: "An object used to tidy your hair.",
    answer: "comb",
    questionSoundPath: "sounds/explore/comb_question.m4a",
    answerSoundPath: "sounds/explore/comb.m4a",
    hintPath: Assets.images.explore.clue.comb.path,
  ),
  QuestionAnswer(
    question: "An object you can use to drink water or juice.",
    answer: "cup",
    questionSoundPath: "sounds/explore/cup_question.m4a",
    answerSoundPath: "sounds/explore/cup.m4a",
    hintPath: Assets.images.explore.clue.cup.path,
  ),
  QuestionAnswer(
    question: "Something you write on.",
    answer: "paper",
    questionSoundPath: "sounds/explore/paper_question.m4a",
    answerSoundPath: "sounds/explore/paper.m4a",
    hintPath: Assets.images.explore.clue.paper.path,
  ),
  QuestionAnswer(
    question: "A thing that you use to color.",
    answer: "crayon",
    questionSoundPath: "sounds/explore/crayons_question.m4a",
    answerSoundPath: "sounds/explore/crayons.m4a",
    hintPath: Assets.images.explore.clue.crayon.path,
  ),
  QuestionAnswer(
    question: "An object you use to clean your teeth.",
    answer: "toothbrush",
    questionSoundPath: "sounds/explore/toothbrush_question.m4a",
    answerSoundPath: "sounds/explore/toothbrush.m4a",
    hintPath: Assets.images.explore.clue.toothbrush.path,
  ),
  QuestionAnswer(
    question: "A writing tool used for writing or drawing lines.",
    answer: "pencil",
    questionSoundPath: "sounds/explore/pencil_question.m4a",
    answerSoundPath: "sounds/explore/pencil.m4a",
    hintPath: Assets.images.explore.clue.pencil.path,
  ),
  QuestionAnswer(
    question: "A round object you can kick or throw to play basketball.",
    answer: "ball",
    questionSoundPath: "sounds/explore/ball_question.m4a",
    answerSoundPath: "sounds/explore/ball.m4a",
    hintPath: Assets.images.explore.clue.ball.path,
  ),
  QuestionAnswer(
    question: "A thing you use to eat food.",
    answer: "spoon or fork",
    questionSoundPath: "sounds/explore/spoon_question.m4a",
    answerSoundPath: "sounds/explore/spoon_and_fork.m4a",
    hintPath: Assets.images.explore.clue.spoon.path,
  ),
  QuestionAnswer(
    question: "An object you use to eat meals.",
    answer: "plate",
    questionSoundPath: "sounds/explore/plate_question.m4a",
    answerSoundPath: "sounds/explore/plate.m4a",
    hintPath: Assets.images.explore.clue.plate.path,
  ),
  QuestionAnswer(
    question: "Something you use to carry books or personal items.",
    answer: "bag",
    questionSoundPath: "sounds/explore/bag_question.m4a",
    answerSoundPath: "sounds/explore/bag.m4a",
    hintPath: Assets.images.explore.clue.bag.path,
  ),
  QuestionAnswer(
    question: "An accessory you wear on your head to protect it from the sun.",
    answer: "hat",
    questionSoundPath: "sounds/explore/hat_question.m4a",
    answerSoundPath: "sounds/explore/hat.m4a",
    hintPath: Assets.images.explore.clue.hat.path,
  ),
  QuestionAnswer(
    question: "An object you keep your money and cards in.",
    answer: "wallet",
    questionSoundPath: "sounds/explore/wallet_question.m4a",
    answerSoundPath: "sounds/explore/wallet.m4a",
    hintPath: Assets.images.explore.clue.wallet.path,
  ),
  QuestionAnswer(
    question: "A small device you wear to know the time.",
    answer: "watch",
    questionSoundPath: "sounds/explore/watch_question.m4a",
    answerSoundPath: "sounds/explore/watch.m4a",
    hintPath: Assets.images.explore.clue.watch.path,
  ),
  QuestionAnswer(
    question: "A round fruit that keeps the doctor away.",
    answer: "apple",
    questionSoundPath: "sounds/explore/apple_question.m4a",
    answerSoundPath: "sounds/explore/apple.m4a",
    hintPath: Assets.images.explore.clue.apple.path,
  ),
  QuestionAnswer(
    question: "A yellow fruit that monkeys love to eat.",
    answer: "banana",
    questionSoundPath: "sounds/explore/banana_question.m4a",
    answerSoundPath: "sounds/explore/banana.m4a",
    hintPath: Assets.images.explore.clue.banana.path,
  ),
  QuestionAnswer(
    question: "Colorful pages full of stories and pictures for kids to enjoy.",
    answer: "book",
    questionSoundPath: "sounds/explore/book_question.m4a",
    answerSoundPath: "sounds/explore/book.m4a",
    hintPath: Assets.images.explore.clue.book.path,
  ),
  QuestionAnswer(
    question: "An object that spins to keep you cool.",
    answer: "fan",
    questionSoundPath: "sounds/explore/fan_question.m4a",
    answerSoundPath: "sounds/explore/fan.m4a",
    hintPath: Assets.images.explore.clue.fan.path,
  ),
  QuestionAnswer(
    question: "A cleaning tool made of sticks, often used to sweep floors.",
    answer: "broom",
    questionSoundPath: "sounds/explore/broom_question.m4a",
    answerSoundPath: "sounds/explore/broom.m4a",
    hintPath: Assets.images.explore.clue.broom.path,
  ),
  QuestionAnswer(
    question: "A decorative container used to hold flowers.",
    answer: "vase",
    questionSoundPath: "sounds/explore/vase_question.m4a",
    answerSoundPath: "sounds/explore/vase.m4a",
    hintPath: Assets.images.explore.clue.vase.path,
  ),
  QuestionAnswer(
    question: "A small container to store things.",
    answer: "jar",
    questionSoundPath: "sounds/explore/jar_question.m4a",
    answerSoundPath: "sounds/explore/jar.m4a",
    hintPath: Assets.images.explore.clue.jar.path,
  ),
  QuestionAnswer(
    question: "Something that ties or holds your hair in place.",
    answer: "hair tie",
    questionSoundPath: "sounds/explore/hairtie_question.m4a",
    answerSoundPath: "sounds/explore/hairtie.m4a",
    hintPath: Assets.images.explore.clue.hairtie.path,
  ),
];
