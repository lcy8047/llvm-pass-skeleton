#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

// namespace {
//     struct Hello : public FunctionPass {
//         static char ID;
//         Hello() : FunctionPass( ID ) {}

//         bool runOnFunction( Function &F ) override {
//             errs() << "Hello: ";
//             errs().write_escaped( F.getName() ) << '\n';
//             return false;
//         }
//     }; // end of struct Hello
// }  // end of anonymous namespace

namespace {
    struct Proj2 : public ModulePass {
        static char ID;
        Proj2() : ModulePass( ID ) {}

        bool runOnModule( Module &M ) override {
            M.getFunction( "main" )->print( outs() );
            return false;
        }
    };
}

char Proj2::ID = 0;
static RegisterPass<Proj2> X( "proj2", "Project 2 Pass" );