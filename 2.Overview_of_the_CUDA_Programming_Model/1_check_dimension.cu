/*
* 1_check_dimension.cu
* nvcc -o a 1_check_dimension.cu && ./a && rm a
*/

#include <cuda_runtime.h>
#include <stdio.h>

__global__ void checkIndex(void){
    printf("threadIdex:(%d,%d,%d) blockIdx:(%d,%d,%d) blockDim:(%d,%d,%d) gridDim(%d,%d,%d)\n",
        threadIdx.x,threadIdx.y,threadIdx.z,
        blockIdx.x,blockIdx.y,blockIdx.z,
        blockDim.x, blockDim.y, blockDim.z,
        gridDim.x,  gridDim.y,  gridDim.z);
    return;
}

int main(int argc, char **argv){
    int nElem = 6;
    dim3 block(3);
    dim3 grid((nElem+block.x - 1)/block.x);
    /*
    * 计算gridDim的方式(nElem+block.x-1)/block.x是为了确保能够覆盖所有的元素，
         即使这些元素不能完全被块的大小整除。
    * (nElem + block.x - 1): 这一步是为了确保即使nElem不能被block.x整除，
         也能计算出正确的网格尺寸。这里减去1是为了让计算更加精确，
         因为如果你直接加上block.x，可能会多算一个块。
    * block.x: 这一步是将经过调整后的总元素数量除以每个块中的线程数量，
         从而得出需要多少个块来处理所有的元素。
    *公式的优点
        1. 确保所有元素都被处理:
           即使元素总数不是块大小的倍数，也能确保所有元素都被分配到块中。
        2. 避免多余的块:
           如果元素总数刚好是块大小的倍数，则不会产生多余的块。
    */

    printf("grid.x=%d, grid.y=%d, grid.z=%d\n",grid.x,grid.y,grid.z);
    printf("block.x=%d, block.y=%d, block.z=%d\n",block.x,block.y,block.z);
    checkIndex<<<grid,block>>>();
    cudaDeviceReset();
    return 0;
}