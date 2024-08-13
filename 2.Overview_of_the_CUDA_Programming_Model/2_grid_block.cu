/*
* 2_grid_block.cu
* nvcc -o a 2_grid_block.cu && ./a && rm a
*/

#include <cuda_runtime.h>
#include <stdio.h>

int main(int argc, char **argv){
    int nElem = 1024;
    dim3 block(1024);
    dim3 grid((nElem-1)/block.x+1);
    printf("while block.x = 1024 :\n");
    printf("grid.x = %d, grid.y = %d, grid.z = %d\n", grid.x, grid.y, grid.z);
    printf("block.x= %d, block.y= %d, block.z= %d\n", block.x, block.y, block.z);
    printf("\n");

    block.x = 512;
    block.x = (nElem-1)/block.x + 1;
    printf("while block.x = 512 :\n");
    printf("grid.x = %d, grid.y = %d, grid.z = %d\n", grid.x, grid.y, grid.z);
    printf("block.x= %d, block.y= %d, block.z= %d\n", block.x, block.y, block.z);
    printf("\n");

    block.x = 256;
    block.x = (nElem-1)/block.x + 1;
    printf("while block.x = 256 :\n");
    printf("grid.x = %d, grid.y = %d, grid.z = %d\n", grid.x, grid.y, grid.z);
    printf("block.x= %d, block.y= %d, block.z= %d\n", block.x, block.y, block.z);
    printf("\n");

    block.x = 128;
    block.x = (nElem-1)/block.x + 1;
    printf("while block.x = 128 :\n");
    printf("grid.x = %d, grid.y = %d, grid.z = %d\n", grid.x, grid.y, grid.z);
    printf("block.x= %d, block.y= %d, block.z= %d\n", block.x, block.y, block.z);
    printf("\n");

    cudaDeviceReset();
    return 0;
}