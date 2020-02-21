#include "gtest/gtest.h"
#include <string.h>

extern "C" {
    #include "impl.h"
}

TEST(myBessel, at_zero) {
  ASSERT_EQ(myBesselFunc(0.0), 1.0);
}

/*
// https://www.wolframalpha.com/input/?i=besselj%5B0%2C1%5D
*/

TEST(myBessel, at_one) {
  ASSERT_EQ(myBesselFunc(1.0), 0.765197686557966551449717526102663220909274289755325241861);
}
