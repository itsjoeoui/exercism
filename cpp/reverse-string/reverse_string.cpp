#include "reverse_string.h"
#include <algorithm>
#include <string>
using namespace std;

namespace reverse_string {
string reverse_string(string input) {

  reverse(input.begin(), input.end());
  return input;
}
} // namespace reverse_string
