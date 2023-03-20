#include "miracl.cuh"

__FUNCTION_HEADER__ void *cuda_calloc(size_t nitems, size_t size)
{
    void *p;

    // 分配失败重复分配策略
    // do
    // {
    //     p = malloc(nitems * size);
    // } while (p == nullptr);
    // memset(p, 0, nitems * size);
    cudaMalloc((void **)&p, nitems * size); // p = malloc(nitems * size);
    if (p)
        memset(p, 0, nitems * size);

    return p;
}

__FUNCTION_HEADER__ size_t cuda_strlen(const char *str)
{
    const char *s;

    for (s = str; *s; ++s)
        ;
    return (s - str);
}

__FUNCTION_HEADER__ int cuda_memcmp(const void *str1, const void *str2, size_t n)
{
    unsigned char *s1 = (unsigned char *)str1, *s2 = (unsigned char *)str2;
    if (!n)
        return 0;

    while (--n && *s1 && *s1 == *s2)
    {
        s1++;
        s2++;
    }

    return *(unsigned char *)s1 - *(unsigned char *)s2;
}

// __FUNCTION_HEADER__ int cuda_putchar(int ch)
// {
//     return printf("%c", ch);
// }

__FUNCTION_HEADER__ void cuda_exit(int status)
{
#ifndef _MY_NO_DEBUG_
    printf("exit(%d) !", status);
#endif
//    while (1)
//        ;
}