# LXDeltaCalculation

LXDeltaCalculation is a clone of [Basket/BKDeltaCalculator](https://github.com/Basket/BKDeltaCalculator). Much of the programming interface was adopted from BKDeltaCalculator but with the following changes:

 - The diff'ing algorithm is different. The main difference is that BKDeltaCalculator will report move changes caused by insertions, while LXDeltaCalculation aim to find those that are have truely moved.
 - The default equality uses `isEqual:` instead of `==`.

Many thanks to BKDeltaCalculator for laying the ground work. Finding a good generalized interface is not easy, much credit to them.

The reason I did not fork but instead clone and rename the project is because I recognize that there are valid use cases for BKDeltaCalculator diff'ing algorithm, while LXDeltaCalculation is aim to be more compatible with UIKit and ASDisplayKit. A seperate project means I could use both project side by side.
