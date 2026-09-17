# NoGraphicsAPI Beef

Windows x64 Beef bindings for `submodules/NoGraphicsAPI`, with the same library/example workspace layout as `bgfx-beef`.

- `csrc/`: C ABI bridge covering the full public rendering API, format information, GPU ranges, and the bump, heap, texture allocator and delete queue utilities.
- `src/`: Beef types and `NoGraphicsAPI.GPU` functions.
- `example/`: Beef triangle renderer, Slang shader, and a small native window/file helper.

Requires Beef, Visual Studio 2022 with C++ tools, CMake 3.24+, and Vulkan SDK 1.4.357+ with `slangc` and `spirv-val` on PATH. The GPU and driver must support NoGraphicsAPI's required Vulkan features.

From the repository directory:

```bat
git submodule update --init --recursive
build_windows_vs2022.cmd
beefbuild -config=Debug -platform=Win64
build\Debug_Win64\example\example.exe
```

The native script builds Debug and Release libraries and compiles/validates both shaders. Open `BeefSpace.toml` in Beef IDE to run the example, or use `beefbuild -run`. `--smoke-test` renders three frames and exits. Shader paths are set by CMake, so the example can run from any working directory within this checkout; rebuild native code after moving the checkout.

To use the library, add `NoGraphicsAPI-beef` to your workspace and project dependencies. The project supplies native library paths and Windows/Vulkan link dependencies. Release, Paranoid and Test use the Release native libraries.

Use `.()` to construct descriptors with upstream defaults; `default` deliberately produces zeroed storage. Structure fields and enum values retain upstream names; functions use PascalCase (`GPU.CreateDevice`, `GPU.Draw`). Spans contain a pointer and element count; `ByteSpan` and GPU ranges count bytes. `GpuCpuRange` and `HeapAllocation` expose byte pointers; cast these for typed application data.

Resources have explicit ownership. Copies of heaps alias the same allocation. Keep span storage alive through each call, keep allocator storage alive until allocator destruction, and destroy resources only after GPU work finishes. Call `GPU.WaitIdle` before shutdown. Delete queue callbacks use a C function pointer and context pointer, which must remain valid until the callback runs; drain queues before destroying them. Windowed device calls stay on the window's message-pump thread.

The C++-only generic math, SIMD and callable helper templates are not separate graphics entry points and are not mirrored as Beef libraries. The shader and API declarations derive from NoGraphicsAPI under the included MIT license.
