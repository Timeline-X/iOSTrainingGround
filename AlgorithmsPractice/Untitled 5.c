#include <stdio.h>

int main(int argc, char *argv[]) {
	char a[] = "We are happy.";
	int i, j, n;
	j = 0;
	for (i = 0; a[i] != '\0'; i++) {
		if (a[i] == ' ') n++;
	}
	char b[i + 2 * n + 1];
	for (i = 0; a[i] != '\0'; i++) {
		if (a[i] != ' ') {
			b[j] = a[i];
			j++;
		}
		else {
			b[j] = '%';
			b[j + 1] = '2';
			b[j + 2] = '0';
			j += 3;
		}
	}
	b[j] = '\0';
	printf("%s", b);
	return 0;
}