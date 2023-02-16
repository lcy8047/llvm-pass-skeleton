# llvm-pass-skeleton

## Requirements

You should install LLVM, clang, cmake and make.

`sudo apt install llvm clang cmake make`

And set `LLVM_DIR` env variable as installed your LLVM directory.

ex) `export LLVM_DIR=/your/llvm/dir`

ex2) `export LLVM_DIR=/usr/lib/llvm-14`

## Build

### 1. Clone repo

`git clone https://github.com/lcy8047/llvm-pass-skeleton.git`

### 2. Build with cmake

`cd llvm-pass-skeleton`

`mkdir build`

`cd build`

`cmake ..`

`make`

Then, you can find `LLVMProj2.so` in `build/lib/Proj2/`.

If you modify pass source code, just `make` again.

## Run

`opt -load ./build/lib/Proj2/LLVMProj2.so --proj2 /your/bitcode_or_ircode/path -enable-new-pm=0`

You should add `-enable-new-pm=0` option to make sure you use legacy passmanager.

FYI, [llvm docs NewPassManager](https://llvm.org/docs/NewPassManager.html), [LLVM Proj Blog The new pass manager](https://blog.llvm.org/posts/2021-03-26-the-new-pass-manager/).

## Make llvm ir code and llvm bitcode

In `test_inputs`, I made makefile to make llvm ir code and llvm bitcode.

You just add C src file in `./test_inputs/src`, then you can make llvm ir code and llvm bitcode with following commands.

`cd test_inputs`

`make`

## Test result

``` Text
$ opt -load ./build/lib/Proj2/LLVMProj2.so --proj2 test_inputs/bc/test.bc -enable-new-pm=0
WARNING: You're attempting to print out a bitcode file.
This is inadvisable as it may cause display problems. If
you REALLY want to taste LLVM bitcode first-hand, you
can force output with the `-f' option.

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %n1 = alloca i32, align 4
  %n2 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n1, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 2, i32* %n1, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %n2, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 3, i32* %n2, align 4, !dbg !16
  %0 = load i32, i32* %n1, align 4, !dbg !17
  %1 = load i32, i32* %n2, align 4, !dbg !18
  %call = call i32 @add(i32 %0, i32 %1), !dbg !19
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !20
  ret i32 0, !dbg !21
}
```

## Reference

[LLVM docs Writing An LLVM Pass](https://llvm.org/docs/WritingAnLLVMPass.html)
