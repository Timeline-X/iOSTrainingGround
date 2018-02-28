#include <stdio.h>

int main(int argc, char *argv[]) {
	int a, m, n;
	scanf("%d", &a);
	m = a;
	n = 0;
	while ((m / 8) != 0) {
		n = m % 8;
		m = m / 8;
		printf("%d\n", n);
	}
	printf("%d\n", m);
	return 0;
}