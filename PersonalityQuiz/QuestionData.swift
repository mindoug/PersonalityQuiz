//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Mindy Douglas on 11/2/20.
//

import Foundation

struct Question {
  var text: String
  var type: ResponseType
  var answers: [Answer]
}

enum ResponseType {
  case single, multiple, ranged
}

struct Answer {
  var text: String
  var type: PonyType
  
}

enum PonyType: String {
  case applejack = "Apple Jack"
  case fluttershy = "Fluttershy"
  case pinkiepie = "Pinkie Pie"
  case rainbowdash = "Rainbow Dash"
  case rarity = "Rarity"
  case twilightsparkle = "Twilight Sparkle"
  
  var definition: String {
    switch self {
      case .applejack:
        return "Applejack is a good friend who believes that the secret to a great friendship lies in honesty and trust.  Her cutie mark represents her connection with the family farm.  She wants nothing more than to carry on the family farm to pass on to her foals.  She loves eating apple fritters and playing musical instruments.   A true farmer, she doesn’t really enjoy fancy, girly things.  She has a pet dog named Winona."
      case .fluttershy:
        return "Known for her kindness to others and her love of animals, Fluttershy believes that a little bit of kindness to others can go a long way.  Even though she loves to sing, Fluttershy hates attention.  Her cutie mark represents her special connection to animals.  Her goal is to become the best animal caretaker in Equestria.  Her favorite snack is fresh picked fruit."
      case .pinkiepie:
        return "Pinkie Pie loves to plan and host parties.  She loves cupcakes, balloons and confetti.  (Just don’t sneak in party poppers.  It won’t end well.)  Her cutie mark reflects her love for parties and laughter.  She believes making her friends happy is the best thing in the world."
      case .rainbowdash:
        return "Rainbow dash is known for her need for speed and her winning attitude. Her favorite game is the Equestrian Dash, and she plays to win.  Her cutie mark is a lightning bolt.  She admires loyalty above all, and believes friends should always stand by each other no matter what.  Rainbow Dash has a great sense of humor and is a bit of a prankster.  She loves cotton candy, but don’t even think about feeding her hot chili peppers.  Too spicy!"
      case .rarity:
        return "Rarity appreciates the finer things in life.  Her cutie mark reflects her love for all things glamorous.  Dress up is Rarity’s favorite game.  She enjoys fashion and being the center of attention.  Although she loves being fancy and eating caviar, Rarity never misses an opportunity to give to others. Rarity has a cat named Opalescence and hopes to become Equestria’s top fashion designer."
        
      case .twilightsparkle:
        return "Always a leader,  Twilight Sparkle believes “With Friendship, we can achieve anything!”  Her cutie mark depicts the Power of Magic, and Twilight likes to share the magic of friendship with everyone she meets. She loves books and knowledge and aspires to be the best student she can.  Her favorite food is pancakes. She really dislikes chaos."
    }
  }
}
