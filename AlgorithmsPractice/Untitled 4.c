#include <stdio.h>

int main(int argc, char *argv[]) {
	int a[] = {49, 38, 65, 97, 49, 13, 27, 76};
	int i, j, k, n;
	
	for (i = 0; i < 8; i++) {
		k = i;
		for (j = i + 1; j < 8; j++) {
			if (a[k] > a[j]) k = j;
		}
		n = a[i];
		a[i] = a[k];
		a[k] = n;
	}
	
	for (i = 0; i < 8; i++) {
		printf("%d ", a[i]);
	}
	
	return 0;
}