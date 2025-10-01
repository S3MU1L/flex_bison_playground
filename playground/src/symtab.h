#ifndef SYMTAB_H
#define SYMTAB_H

int symtab_get(const char* name, int* out);
void symtab_set(const char* name, int val);

#endif

