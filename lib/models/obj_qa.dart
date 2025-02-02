import 'package:tinytots/gen/assets.gen.dart';

class QuestionAnswer {
  final String question;
  final String answer;
  final String questionSoundPath;
  final String answerSoundPath;
  final String hintPath;
  final String type;

  QuestionAnswer({
    required this.question,
    required this.answer,
    this.type = "object",
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
  // QuestionAnswer(
  //   question: "Colorful pages full of stories and pictures for kids to enjoy.",
  //   answer: "book",
  //   questionSoundPath: "sounds/explore/book_question.m4a",
  //   answerSoundPath: "sounds/explore/book.m4a",
  //   hintPath: Assets.images.explore.clue.book.path,
  // ),
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
  //new
  QuestionAnswer(
    question: "This keeps you dry when it rains.",
    answer: "umbrella",
    questionSoundPath: "sounds/explore/umbrella_question.m4a",
    answerSoundPath: "sounds/explore/umbrella.m4a",
    hintPath: Assets.images.explore.clue.umbrella.path,
  ),
  QuestionAnswer(
    question: "You sit on this when you're tired.",
    answer: "chair",
    questionSoundPath: "sounds/explore/chair_question.m4a",
    answerSoundPath: "sounds/explore/chair.m4a",
    hintPath: Assets.images.explore.clue.chair.path,
  ),
  QuestionAnswer(
    question: "This helps you cut paper.",
    answer: "scissors",
    questionSoundPath: "sounds/explore/scissors_question.m4a",
    answerSoundPath: "sounds/explore/scissors.m4a",
    hintPath: Assets.images.explore.clue.scissors.path,
  ),
  QuestionAnswer(
    question: "You use these to open a door or a lock.",
    answer: "key",
    questionSoundPath: "sounds/explore/key_question.m4a",
    answerSoundPath: "sounds/explore/key.m4a",
    hintPath: Assets.images.explore.clue.key.path,
  ),
  QuestionAnswer(
    question: "This fixes a mistake in your drawing or writing.",
    answer: "eraser",
    questionSoundPath: "sounds/explore/eraser_question.m4a",
    answerSoundPath: "sounds/explore/eraser.m4a",
    hintPath: Assets.images.explore.clue.eraser.path,
  ),
  QuestionAnswer(
    question: "Water comes out of this when you turn it on.",
    answer: "faucet",
    questionSoundPath: "sounds/explore/faucet_question.m4a",
    answerSoundPath: "sounds/explore/faucet.m4a",
    hintPath: Assets.images.explore.clue.faucet.path,
  ),
  QuestionAnswer(
    question: "You sleep on this at night.",
    answer: "bed",
    questionSoundPath: "sounds/explore/bed_question.m4a",
    answerSoundPath: "sounds/explore/bed.m4a",
    hintPath: Assets.images.explore.clue.bed.path,
  ),
  QuestionAnswer(
    question: "This toy looks like a tiny person, and you can dress it up.",
    answer: "doll",
    questionSoundPath: "sounds/explore/doll_question.m4a",
    answerSoundPath: "sounds/explore/doll.m4a",
    hintPath: Assets.images.explore.clue.doll.path,
  ),
  QuestionAnswer(
    question: "This gives you light when it’s dark.",
    answer: "lamp",
    questionSoundPath: "sounds/explore/lamp_question.m4a",
    answerSoundPath: "sounds/explore/lamp.m4a",
    hintPath: Assets.images.explore.clue.lamp.path,
  ),
  QuestionAnswer(
    question: "You rest your head on this when you sleep.",
    answer: "pillow",
    questionSoundPath: "sounds/explore/pillow_question.m4a",
    answerSoundPath: "sounds/explore/pillow.m4a",
    hintPath: Assets.images.explore.clue.pillow.path,
  ),
  QuestionAnswer(
    question: "You wear these on your feet at home to stay comfy.",
    answer: "slippers",
    questionSoundPath: "sounds/explore/slippers_question.m4a",
    answerSoundPath: "sounds/explore/slippers.m4a",
    hintPath: Assets.images.explore.clue.slippers.path,
  ),
  QuestionAnswer(
    question: "You pour tea using this.",
    answer: "teapot",
    questionSoundPath: "sounds/explore/teapot_question.m4a",
    answerSoundPath: "sounds/explore/teapot.m4a",
    hintPath: Assets.images.explore.clue.teapot.path,
  ),
  QuestionAnswer(
    question: "This is something you use to work or eat on.",
    answer: "table",
    questionSoundPath: "sounds/explore/table_question.m4a",
    answerSoundPath: "sounds/explore/table.m4a",
    hintPath: Assets.images.explore.clue.table.path,
  ),
  QuestionAnswer(
    question: "This is used to carry water.",
    answer: "bucket",
    questionSoundPath: "sounds/explore/bucket_question.m4a",
    answerSoundPath: "sounds/explore/bucket.m4a",
    hintPath: Assets.images.explore.clue.bucket.path,
  ),
  QuestionAnswer(
    question: "This is where you keep your toys or things safe.",
    answer: "box",
    questionSoundPath: "sounds/explore/box_question.m4a",
    answerSoundPath: "sounds/explore/box.m4a",
    hintPath: Assets.images.explore.clue.box.path,
  ),
  //shapes
  QuestionAnswer(
    question: "This shape is round, with no corners.",
    answer: "circle",
    questionSoundPath: "sounds/explore/circle_question.m4a",
    answerSoundPath: "sounds/explore/circle.m4a",
    hintPath: Assets.images.explore.clue.circle.path,
    type: "shape",
  ),
  QuestionAnswer(
    question:
        "This shape has four sides, with two long ones and two short ones.",
    answer: "rectangle",
    questionSoundPath: "sounds/explore/rectangle_question.m4a",
    answerSoundPath: "sounds/explore/rectangle.m4a",
    hintPath: Assets.images.explore.clue.rectangle.path,
    type: "shape",
  ),
  QuestionAnswer(
    question: "This shape is round but looks longer than a circle.",
    answer: "oval",
    questionSoundPath: "sounds/explore/oval_question.m4a",
    answerSoundPath: "sounds/explore/oval.m4a",
    hintPath: Assets.images.explore.clue.oval.path,
    type: "shape",
  ),
  QuestionAnswer(
    question: "This shape has four sides that are all the same length.",
    answer: "square",
    questionSoundPath: "sounds/explore/square_question.m4a",
    answerSoundPath: "sounds/explore/square.m4a",
    hintPath: Assets.images.explore.clue.square.path,
    type: "shape",
  ),
  QuestionAnswer(
    question: "This shape has three sides and three corners.",
    answer: "triangle",
    questionSoundPath: "sounds/explore/triangle_question.m4a",
    answerSoundPath: "sounds/explore/triangle.m4a",
    hintPath: Assets.images.explore.clue.triangle.path,
    type: "shape",
  ),

  //colors
  QuestionAnswer(
    question: "Find something that is red.",
    answer: "red",
    questionSoundPath: "sounds/explore/red_question.m4a",
    answerSoundPath: "sounds/explore/red.m4a",
    // hintPath: Assets.images.explore.clue.red.path,
    type: "color",
  ),
  QuestionAnswer(
    question: "Find something that is yellow.",
    answer: "yellow",
    questionSoundPath: "sounds/explore/yellow_question.m4a",
    answerSoundPath: "sounds/explore/yellow.m4a",
    // hintPath: Assets.images.explore.clue.yellow.path,
    type: "color",
  ),
  QuestionAnswer(
    question: "Find something that is green.",
    answer: "green",
    questionSoundPath: "sounds/explore/green_question.m4a",
    answerSoundPath: "sounds/explore/green.m4a",
    // hintPath: Assets.images.explore.clue.green.path,
    type: "color",
  ),
  QuestionAnswer(
    question: "Find something that is blue.",
    answer: "blue",
    questionSoundPath: "sounds/explore/blue_question.m4a",
    answerSoundPath: "sounds/explore/blue.m4a",
    // hintPath: Assets.images.explore.clue.blue.path,
    type: "color",
  ),
  QuestionAnswer(
    question: "Find something that is orange.",
    answer: "orange",
    questionSoundPath: "sounds/explore/orange_question.m4a",
    answerSoundPath: "sounds/explore/orange.m4a",
    // hintPath: Assets.images.explore.clue.orange.path,
    type: "color",
  ),
];
