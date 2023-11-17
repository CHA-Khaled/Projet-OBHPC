//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i];

  return d;
}

//
f64 reduc_base_unroll8(f64 *restrict a, u64 n)
{
  double d = 0.0;
  u64 i;

  // Déroulage x8 : Traiter 8 éléments à la fois
  for (i = 0; i < n - 7; i += 8) {
    d += a[i];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
    d += a[i + 4];
    d += a[i + 5];
    d += a[i + 6];
    d += a[i + 7];
  }

  // Traiter les éléments restants (moins de 8)
  for (; i < n; i++) {
    d += a[i];
  }

  return d;
}

//
f64 reduc_base_unroll4(f64 *restrict a, u64 n)
{
  double d = 0.0;
  u64 i;

  // Déroulage x4 : Traiter 4 éléments à la fois
  for (i = 0; i < n - 3; i += 4) {
    d += a[i];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
  }

  // Traiter les éléments restants (moins de 4)
  for (; i < n; i++) {
    d += a[i];
  }

  return d;
}

//
f64 reduc_cblas(f64 *restrict a, u64 n){
  f64 _b = 1;
  return cblas_ddot(n, a, 1, &_b, 0);
}

