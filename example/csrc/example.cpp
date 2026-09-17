#include "example_support.hpp"
#include <stdio.h>
#include <stdlib.h>
extern "C"
{
    void* nga_example_open()
    {
        return open_example_window("NoGraphicsAPI Beef triangle", 800, 600);
    }
    bool nga_example_pump(void* window)
    {
        return pump_example_window(window);
    }
    void nga_example_close(void* window)
    {
        close_example_window(window);
    }
    void nga_example_read_shader(const char* path, gpu::Span<gpu::uint32>* result)
    {
        char shader_path[1024];
        snprintf(shader_path, sizeof(shader_path), "%s/%s", NOGRAPHICSAPI_SHADER_DIRECTORY, path);
        *result = read_spirv(shader_path);
    }
    void nga_example_free_shader(void* data)
    {
        free(data);
    }
}
