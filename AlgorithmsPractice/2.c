#include <stdio.h>


int main(int argc, char *argv[]) {
	int a[] = {29, 10, 2, 3, 5, 19, 38, 2, 48, 37, 10};
	int len, n;
	int i;
	
	void Hsort (int *a, int, int);
	
	len = sizeof(a) / sizeof(a[0]);
	
	for (i = len / 2; i >= 0; i--) {
		Hsort(a, i, len);
	}
	
	for (i = len - 1; i > 0; i--) {
		n = a[i];
		a[i] = a[0];
		a[0] = n;
		Hsort(a, 0, i);
	}
	
	for (i = 0; i < len; i++) {
		printf("%d ", a[i]);
	}
	
	return 0;
}

void Hsort (int *a, int s, int len) {
	int n;
	if (2 * s + 1 < len) {
		if (a[s] >= a[2 * s] && a[s] >= a[2 * s + 1]) return;
		if (a[s] < a[2 * s] && a[2 * s] >= a[2 * s + 1]) {
			n = a[s];
			a[s] = a[2 * s];
			a[2 * s] = n;
			Hsort(a, 2 * s, len);
		}
		if (a[s] < a[2 * s + 1] && a[2 * s] < a[2 * s + 1]) {
			n = a[s];
			a[s] = a[2 * s + 1];
			a[2 * s + 1] = n;
			Hsort(a, 2 * s + 1, len);
		}
	}
	
	if (2 * s  + 1== len) {
		if (a[s] >= a[2 * s]) {
			return;
		}
		else {
			n = a[s];
			a[s] = a[2 * s];
			a[2 * s] = n;
			return;
		}
	}
	
	if (2 * s >= len) {
		return;
	}
}