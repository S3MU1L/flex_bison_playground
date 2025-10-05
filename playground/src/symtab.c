#include "symtab.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct {
    char *name;
    int value;
} entry;

static entry *entries = NULL;
static size_t count = 0;
static size_t capacity = 0;

int symtab_get(const char* name, int* out) {
    for (size_t i = 0; i < count; ++i) {
        if (strcmp(entries[i].name, name) == 0) {
            *out = entries[i].value;
            return 1;
        }
    }
    return 0;
}

void symtab_set(const char* name, int val) {
    for (size_t i = 0; i < count; ++i) {
        if (strcmp(entries[i].name, name) == 0) {
            entries[i].value = val;
            return;
        }
    }
    if (count == capacity) {
        capacity = capacity ? capacity * 2 : 16;
        entries = realloc(entries, capacity * sizeof(entry));
        if (!entries) {
            perror("realloc");
            exit(1);
        }
    }
    entries[count].name = strdup(name);
    entries[count].value = val;
    count++;
}
