#include <stdio.h>

int main(int argc, char *argv[]) {
	int a[] = {49, 38, 65, 97, 76, 13, 27, 49};
	int i;
	void Qsort (int a[], int, int);
	
	Qsort(a, 0, 7);
	
	for (i = 0; i < 8; i++) {
		printf("%d ", a[i]);
	}
	return 0;
}

int Partition (int a[], int low, int high)
{
	int pivotkey = low;
	int n;
	while (low < high) {
			while (pivotkey < high && a[pivotkey] <= a[high]) {
				high--;
			}
			n = a[pivotkey];
			a[pivotkey] = a[high];
			a[high] = n;
			pivotkey = high;
			
			while (pivotkey > low && a[pivotkey] >= a[low]) {
				low++;
			}
			n = a[pivotkey];
			a[pivotkey] = a[low];
			a[low] = n;
			pivotkey = low;
		}
	return pivotkey;
}

void Qsort (int a[], int low, int high)
{
	int pivotkey = Partition(a, low, high);
	
	if (pivotkey > low) Qsort(a, low, pivotkey - 1);
	if (pivotkey < high) Qsort(a, pivotkey + 1, high);
}