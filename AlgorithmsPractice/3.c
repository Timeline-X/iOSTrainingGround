#include <stdio.h>

int main(int argc, char *argv[]) {
	int a[] = {49, 39, 2, 40, 1, 3, 4, 2, 37, 19, 7};
	void fun1 (int *p, int, int, int);
	int k, low, mid, high;
	for (k = 1; k < 12; k *= 2) {
		low  = 0;
		mid  = low + k - 1;
		high = mid + k;
		while (high < 11) {
			fun1(a, low, mid, high);
			low  = high + 1;
			mid  = low + k -1;
			high = mid + k;
		}
		if (mid + 1 < 11) {
			fun1(a, low, mid, 10);
		}
	}
	
	for (k = 0; k < 11; k++) {
		printf("%d ", a[k]);
	}
	return 0;
}

void fun1 (int *p, int low, int mid, int high)
{
	int l = high - low + 1;
	int i, j, k;
	int a[l];
	k = 0;
	i = low;
	j = mid + 1;
	while (i <= mid && j <= high) {
		if (p[i] < p[j]) {
			a[k] = p[i];
			k++;
			i++;
		}
		else if (p[i] == p[j]) {
			a[k] = p[i];
			a[k + 1] = p[i];
			k += 2;
			i++;
			j++;
		}
		else {
			a[k] = p[j];
			k++;
			j++;
		}
	}
	while (i > mid && j <= high) {
		a[k] = p[j];
		k++;
		j++;
	}
	while (i <= mid && j > high) {
		a[k] = p[i];
		k++;
		i++;
	}
	for (i = low, k = 0; i <= high; i++, k++) {
		p[i] = a[k];
	}
}