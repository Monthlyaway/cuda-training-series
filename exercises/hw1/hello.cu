#include <stdio.h>

__global__ void hello()
{
	printf("Hello from block: %u, thread: %u\n", blockIdx.x, threadIdx.x);
}

int main()
{
	hello<<<5, 10>>>();
	cudaError_t cudaerr = cudaDeviceSynchronize();
	if (cudaerr != cudaSuccess)
		printf("kernel launch failed with error \"%s\".\n", cudaGetErrorString(cudaerr));
	// cudaDeviceSynchronize();
}
