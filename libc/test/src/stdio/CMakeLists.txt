add_libc_testsuite(libc_stdio_unittests)

add_libc_unittest(
  fileop_test
  SUITE
    libc_stdio_unittests
  SRCS
    fileop_test.cpp
  DEPENDS
    libc.include.errno
    libc.include.stdio
    libc.src.stdio.clearerr
    libc.src.stdio.fclose
    libc.src.stdio.feof
    libc.src.stdio.ferror
    libc.src.stdio.fflush
    libc.src.stdio.fopen
    libc.src.stdio.fread
    libc.src.stdio.fseek
    libc.src.stdio.fwrite
)

add_libc_unittest(
  unlocked_fileop_test
  SUITE
    libc_stdio_unittests
  SRCS
    unlocked_fileop_test.cpp
  DEPENDS
    libc.include.errno
    libc.include.stdio
    libc.src.stdio.clearerr_unlocked
    libc.src.stdio.fclose
    libc.src.stdio.feof_unlocked
    libc.src.stdio.ferror_unlocked
    libc.src.stdio.flockfile
    libc.src.stdio.fopen
    libc.src.stdio.fread_unlocked
    libc.src.stdio.funlockfile
    libc.src.stdio.fwrite_unlocked
)

add_libc_unittest(
  fopencookie_test
  SUITE
    libc_stdio_unittests
  SRCS
    fopencookie_test.cpp
  DEPENDS
    libc.include.errno
    libc.include.stdio
    libc.include.stdlib
    libc.src.stdio.clearerr
    libc.src.stdio.fclose
    libc.src.stdio.feof
    libc.src.stdio.ferror
    libc.src.stdio.fflush
    libc.src.stdio.fopencookie
    libc.src.stdio.fread
    libc.src.stdio.fseek
    libc.src.stdio.fwrite
  LINK_LIBRARIES
    LibcMemoryHelpers
)

add_subdirectory(printf_core)

add_subdirectory(testdata)
