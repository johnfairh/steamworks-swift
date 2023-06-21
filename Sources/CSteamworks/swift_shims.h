#include <stdlib.h>

static inline void my_setenv(const char *name, const char *value) {
  setenv(name, value, 1);
}
