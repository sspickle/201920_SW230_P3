#include "gtest/gtest.h"
#include <string.h>

extern "C" {
    #include "impl.h"
}

TEST(my, test) {
  int x = 0;
  ASSERT_EQ(x, 0);
}
