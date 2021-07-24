//Konstantinos Bourantas 
//AM: 23 6145
//bourantas@ceid.upatras.gr

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <ctime>
#include <cublas_v2.h>
#include <string>
#include <cmath>
#include <stdio.h>
#include <sys/time.h>
///////////////////////////////////////////////////////////////////////////////////////////////////////////


#define TILE_SIZE 16
#define BLOCK_SIZE 16

using namespace std;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
#define cudaCheckError() {                               \
                cudaError_t e = cudaGetLastError();                    \
                if (e != cudaSuccess) {                                \
                        printf("CUDA error %s:%d: %s\n", __FILE__, __LINE__, \
                               cudaGetErrorString(e));                      \
                        exit(1);                                             \
                }                                                      \
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

void calculateElapsedTime(int iterations, float time_elapsed){
       
  cout << "Average time elapsed: " << time_elapsed/iterations << " seconds" << endl;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Print matrix A(rows_A, cols_A) storage in column-major format
void print_matrix(double
	const *const A, const int rows, const int cols)
{
	int i, j;
	for (i = 0; i < rows; ++i)
	{
		for (j = 0; j < cols; ++j)
		{
			printf("%.2lf ", A[i *cols + j]);
		}
		printf("\n");
	}
	printf("\n");
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////

__global__ void matrixMultKernel(double* A,  double* C, int rows_A, int cols_A ,int rows_C, int cols_C)
{
    float temp_sum = 0;

    int Row = blockIdx.y*TILE_SIZE + threadIdx.y;
    int Col = blockIdx.x*TILE_SIZE + threadIdx.x;

    __shared__ float A_shared[TILE_SIZE][TILE_SIZE+1];
    __shared__ float A_T_shared[TILE_SIZE][TILE_SIZE+1];

    for (int i = 0; i < (TILE_SIZE +cols_A - 1)/TILE_SIZE; i++) {
    
         if (i*TILE_SIZE + threadIdx.y <cols_A && Col < rows_A)
             A_T_shared[threadIdx.y][threadIdx.x] = A[(i*TILE_SIZE+threadIdx.y)+Col*rows_A];
         else
             A_T_shared[threadIdx.y][threadIdx.x] = 0.0;

         if (i*TILE_SIZE + threadIdx.x <cols_A && Row < rows_A)
             A_shared[threadIdx.y][threadIdx.x] = A[Row*cols_A+ i*TILE_SIZE + threadIdx.x];
         else
             A_shared[threadIdx.y][threadIdx.x] = 0.0;

         
         __syncthreads();

         for (int n = 0; n < TILE_SIZE; ++n)
             temp_sum += A_T_shared[threadIdx.y][n] * A_shared[n][threadIdx.x];

         __syncthreads();
    }

    if (Row < rows_C && Col < cols_C){

	C[Col*rows_C+Row] = temp_sum;

}
		

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv)
{

	//fixed srand for debugging
	srand(time(0));

	//select device
	cudaSetDevice(0);
	cudaCheckError();

	if (argc < 4)
	{
		cout << "Usage: " << argv[0] << "[Rows]-[Cols]-[Iterations]" << endl;
		return 1;
	}

	//user input
	unsigned int rows_A, cols_A, rows_C, cols_C, rows_A_T, cols_A_T;

	rows_A = cols_A_T = atoi(argv[1]);
	cols_A = rows_A_T = rows_C = cols_C = atoi(argv[2]);
	int iterations = atoi(argv[3]);

	cudaEvent_t start, stop;

	// Allocate host_A and host_C on host
	double *host_A = (double*) malloc(rows_A *cols_A* sizeof(double));
	double *host_C = (double*) malloc(rows_C *cols_C* sizeof(double));

	//fill array host_A with values
	double random_data = 1.0;
  for (int i = 0; i < rows_A * cols_A; i++)
	{
		host_A[i] = random_data;
		random_data += 1.0;
	}
 
	print_matrix(host_A, rows_A, cols_A);

	// Allocate array device_A and deive_C on GPU memory
	double *device_A;
	cudaMalloc(&device_A, rows_A *cols_A* sizeof(double));
	cudaCheckError();
 

	double *device_C;
	cudaMalloc(&device_C, rows_C *cols_C* sizeof(double));
	cudaCheckError();

	//Copy array host_A to gpu thought device_A
	cudaMemcpy(device_A, host_A, rows_A *cols_A* sizeof(double), cudaMemcpyHostToDevice);
	cudaCheckError();
 	

	//create cuda events for time measuring
	cudaEventCreate(&start);
	cudaCheckError();
	cudaEventCreate(&stop);
	cudaCheckError();
 	

	float time_elapsed = 0;
	float tempTime;

	cout << "Executing operation for matrix A with " <<
		cols_A << " columns and " << rows_A << " rows." << endl;
	cout << "=======================================" << endl;

	//begin iterations
	for (int i = 0; i < iterations; i++)
	{

		tempTime = 0;

		// Create cublas handle
		cublasHandle_t handle;
		cudaCheckError();
		cublasCreate(&handle);
		cudaCheckError();
		cudaEventRecord(start);
		cudaCheckError();

		
		dim3 dimBlock(TILE_SIZE, TILE_SIZE, 1);
		dim3 dimGrid;

		dimGrid.x = (cols_C + dimBlock.x - 1)/dimBlock.x;
		dimGrid.y = (rows_C+ dimBlock.y - 1)/dimBlock.y;



		// Launch kernel////////////////////////////////////////////////////

		matrixMultKernel <<<dimGrid, dimBlock>>>(device_A, device_C, rows_A,cols_A, rows_C, cols_C);
		cudaCheckError();
		
		////////////////////////////////////////////////////////////////////

		cudaEventRecord(stop);
		cudaCheckError();

		// Destroy the handle
		cublasDestroy(handle);
		cudaCheckError();

		// Copy the resulted matrix device_C to host
		cudaMemcpy(host_C, device_C, rows_C *cols_C* sizeof(double), cudaMemcpyDeviceToHost);
		cudaCheckError();

		cudaEventSynchronize(stop);
		cudaCheckError();

		// Compute the elapsed time between the two events start and stop
		cudaEventElapsedTime(&tempTime, start, stop);
		cudaCheckError();

		cout << "Iteration " << i + 1 << ": " << tempTime << " seconds" << endl;
		time_elapsed += tempTime;
	}

	print_matrix(host_C, rows_C, cols_C);

	cudaEventDestroy(start);
	cudaCheckError();

	cudaEventDestroy(stop);
	cudaCheckError();

	cout << "=======================================" << endl;

	//calculate average elapsed time
	calculateElapsedTime(iterations, time_elapsed);

	//Free memory on host and device
	cudaFree(device_A);
	cudaCheckError();
	free(host_A);

	cudaFree(device_C);
	cudaCheckError();
	free(host_C);

	return 0;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
