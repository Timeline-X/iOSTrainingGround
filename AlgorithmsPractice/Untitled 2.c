#include <stdio.h>

int main(int argc, char *argv[]) {
	int a[] = {5, 16, 20, 27, 30, 36, 44, 55, 60, 67, 71};
	int b, n;
	scanf("%d", &b);
	int Search (int a[], int, int, int);
	n = Search(a, b, 0, 10);
	printf("%d\n", n);
	return 0;
}

int Search (int a[], int key, int low, int high) {
	if (low <= high) {
		int mid = (low + high) / 2;
		if (key == a[mid]) {
			return mid;
		}
		else if (key >= a[mid]) {
			return Search(a, key, mid + 1, high);
		}
		else  {
			return Search(a, key, low, mid - 1);
		}
	}
	else return 11;
}