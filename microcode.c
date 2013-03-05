#include "microcode.h"

int main(void)
{
  size_t i;
  uint32_t val;
  FILE *fp;
  size_t n = sizeof(ucode) / 4;

  fp = fopen("microcode.bin", "w");
  if(!fp) {
    fprintf(stderr, "unable to open microcode.bin for writing, quitting\n");
    return 1;
  }

  for (i = 0; i < n; i++) {
    val = ucode[i];
    if (fwrite(&val, 4, 1, fp) != 1) {
      fprintf(stderr, "error writing to microcode.bin (at i %ld)\n", i);
      fclose(fp);
      return 1;
    }
  }

  fclose(fp);

  return 0;
}
