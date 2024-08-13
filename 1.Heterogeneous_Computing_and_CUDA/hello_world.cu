/*
    hello_world.cu
    nvcc -o a hello_world.cu&& ./a && rm a
*/

#include <stdio.h>

// Each of these ten threads will print the text once.
__global__ void hello_world(void){
    printf("printed by %d : GPU: Hello world!\n",threadIdx.x);
    // printf("GPU: Hello world!\n");
}

int main(){
    // Here "CPU: Hello world!\n" is a string printed by CPU(Host).
    printf("CPU: Hello world!\n");
    hello_world<<<1,10>>>();
    cudaDeviceReset();
    return 0;
}