; ModuleID = 'src/test.c'
source_filename = "src/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add(i32 %a, i32 %b) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %1 = load i32, i32* %b.addr, align 4, !dbg !18
  %add = add nsw i32 %0, %1, !dbg !19
  ret i32 %add, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %n1 = alloca i32, align 4
  %n2 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n1, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 2, i32* %n1, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %n2, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 3, i32* %n2, align 4, !dbg !27
  %0 = load i32, i32* %n1, align 4, !dbg !28
  %1 = load i32, i32* %n2, align 4, !dbg !29
  %call = call i32 @add(i32 %0, i32 %1), !dbg !30
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !31
  ret i32 0, !dbg !32
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "src/test.c", directory: "/home/lab/etc/llvm_skeleton/test_inputs")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 3, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 3, type: !12)
!14 = !DILocation(line: 3, column: 14, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 3, type: !12)
!16 = !DILocation(line: 3, column: 21, scope: !9)
!17 = !DILocation(line: 5, column: 12, scope: !9)
!18 = !DILocation(line: 5, column: 16, scope: !9)
!19 = !DILocation(line: 5, column: 14, scope: !9)
!20 = !DILocation(line: 5, column: 5, scope: !9)
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !22, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!12}
!24 = !DILocalVariable(name: "n1", scope: !21, file: !1, line: 10, type: !12)
!25 = !DILocation(line: 10, column: 9, scope: !21)
!26 = !DILocalVariable(name: "n2", scope: !21, file: !1, line: 11, type: !12)
!27 = !DILocation(line: 11, column: 9, scope: !21)
!28 = !DILocation(line: 13, column: 24, scope: !21)
!29 = !DILocation(line: 13, column: 28, scope: !21)
!30 = !DILocation(line: 13, column: 19, scope: !21)
!31 = !DILocation(line: 13, column: 5, scope: !21)
!32 = !DILocation(line: 15, column: 5, scope: !21)
