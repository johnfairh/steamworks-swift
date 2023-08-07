#include <stdlib.h>

static inline void my_setenv(const char *name, const char *value) {
  setenv(name, value, 1);
}

static inline void my_unsetenv(const char *name) {
  unsetenv(name);
}
