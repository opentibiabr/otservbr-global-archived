Compiling your server in debug mode enables you to inspect and verify the stacktraces, pause the execution and evaluate expressions and variables at runtime. It also provides richer information when segmentation faults happen.

To include the debug markers you need to run `cmake` with a flag:

```
$ cmake -DCMAKE_BUILD_TYPE=Debug ..
```

Keep in mind that this impact your server performance.

## Running in VSCode

You can use [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) to run the server inside Visual Code and use breakpoints and evaluate exceptions in runtime.

![image](images/debugging.png)

## Caveats

### MacOS and link time optimization (LTO)

When compiling the server in MacOS (Tested in Catalina 10.15.6), even in Debug mode, the server will not include the linked files with the debug information. When using CodeLLDB, you will see disassembled files with the header:

```
; Source location: unknown
```

And, if you try to read the debug information from the binary, you will find that the objects linked don't exist:

```
$ dsymutil otbr
...
warning: (x86_64) /tmp/lto.o unable to open object file: No such file or directory
...
```

To avoid that, you need to disable LTO. So far, the only way I could figure out how to do that is to remove manually them from the generated files by cmake. You will look for the `-flto` flags in the build directory after running cmake and remove all of them. For example:

```diff
- CXX_FLAGS =  -std=c++11 -lstdc++ -lpthread -ldl -g -flto=thin -isysroot ...
+ CXX_FLAGS =  -std=c++11 -lstdc++ -lpthread -ldl -g -isysroot ...
```


## Credits

- [TFS - Original documentation](https://github.com/otland/forgottenserver/wiki/Compiling-debug-binaries-in-cmake)
- [StackOverflow - No debug info / source code with LLDB on OSX](https://stackoverflow.com/questions/56707019/no-debug-info-source-code-with-lldb-on-osx)