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
#include <fstream>

using namespace std;
/////////////////////////////////////////////////////////////////////////////////////////////////////

#define cudaCheckError() {                               \
        cudaError_t e = cudaGetLastError();                    \
        if (e != cudaSuccess) {                                \
                printf("CUDA error %s:%d: %s\n", __FILE__, __LINE__, \
                       cudaGetErrorString(e));                      \
                exit(1);                                             \
        }                                                      \
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
// Fill  random numbers on GPU
double fill_rand() {
  double s = 0, d = 0;
  s = rand() % 40 - 20;
  d = s / 137;
  return d;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
//Print matrix A(rows_A, cols_A) storage in column-major format
void print_matrix( double * A, int rows_A, int cols_A) {


  for (int i = 0; i < rows_A; ++i) {
    for (int j = 0; j < cols_A; ++j) {
      printf("%.2lf ", A[i *cols_A + j]);
      
    }
    printf("\n");

   
  }
printf("\n");
 

}
/////////////////////////////////////////////////////////////////////////////////////////////////////

void calculateElapsedTime(int iterations, float time_elapsed){
       
        cout << "Average time elapsed: " << time_elapsed/iterations << " seconds" << endl;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
int main(int argc, char * * argv) {

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

	unsigned int rows_A, cols_A, rows_C, cols_C, rows_A_T, cols_A_T;

	rows_A = cols_A_T = atoi(argv[1]);
	cols_A = rows_A_T = atoi(argv[2]);
	rows_C = cols_C = cols_A;
	int iterations = atoi(argv[3]);

	cudaEvent_t start, stop;

	// Allocate host_A and host_C on host
	double *host_A = (double*) malloc(rows_A *cols_A* sizeof(double));
	double *host_C = (double*) malloc(rows_C *cols_C* sizeof(double));

	//fill array host_A with values in column major order

	double random_data = 1.0;
	for (int i = 0; i < rows_A; ++i)
	{
		for (int j = 0; j < cols_A; ++j)
		{
			host_A[j *rows_A + i] = random_data;
			random_data += 1.0;
		}
	}

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

	for (int i = 0; i < iterations; i++)
	{

		tempTime = 0;

	
		double alpha = 1;
		double beta = 0;

		// Create cublas handle
		cublasHandle_t handle;
		cudaCheckError();
		cublasCreate(&handle);
		cudaCheckError();
		cudaEventRecord(start);
		cudaCheckError();

		cublasDgemm(handle, CUBLAS_OP_T,
			CUBLAS_OP_N, cols_A,
			cols_A, rows_A, &alpha, device_A,
			rows_A, device_A,
			rows_A, &beta,
			device_C, cols_A);
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
	//calculate elapsed time
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