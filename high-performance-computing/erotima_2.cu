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
void print_matrix(double const * const A, const int rows, const int cols) {
	int i, j;
	for (i = 0; i < rows; ++i) {
		for (j = 0; j < cols; ++j) {
			printf("%.2lf ", A[i * cols + j]);
		}
		printf("\n");
	}
	printf("\n");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

__global__ void multiplicationKernel(double const * const input_matrix, double * const output_matrix, const int rows_A, const int cols_A) {
	
	const int row = blockIdx.y * blockDim.y + threadIdx.y;
    const int col = blockIdx.x * blockDim.x + threadIdx.x;
                
	double tempSum = 0.0;
    
	if (row < cols_A && col < cols_A) 
	{
		for (int i = 0; i < rows_A; ++i) {
            // printf("multiplying A[%d]=%f * A[%d]=%f\n",i * cols_A + row, input_matrix[i * cols_A + row],i * cols_A + col,input_matrix[i * cols_A + col]);
			tempSum += input_matrix[i * cols_A + row] * input_matrix[i * cols_A + col];
		}
		output_matrix[row * cols_A + col] = tempSum;
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
		printf("host_A[%d]=%f",i,host_A[i]);
		random_data += 1.0;
	}

	print_matrix(host_A,rows_A,cols_A);

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

		unsigned int grid_rows = (cols_A + BLOCK_SIZE - 1) / BLOCK_SIZE;
		unsigned int grid_cols = (rows_A + BLOCK_SIZE - 1) / BLOCK_SIZE;
		dim3 dimGrid(grid_cols, grid_rows);
		dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);

		// Create cublas handle
		cublasHandle_t handle;
		cudaCheckError();
		cublasCreate(&handle);
		cudaCheckError();
		cudaEventRecord(start);
		cudaCheckError();

		//run gpu kernel
		multiplicationKernel <<<dimGrid, dimBlock>>> (device_A, device_C, rows_A, cols_A);
		cudaCheckError();

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
