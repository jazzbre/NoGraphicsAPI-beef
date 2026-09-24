using System;
using NoGraphicsAPI;
namespace Example;
class Program
{
    [CLink] static extern void* nga_example_open();
    [CLink] static extern bool nga_example_pump(void* window);
    [CLink] static extern void nga_example_close(void* window);
    [CLink] static extern void nga_example_read_shader(char8* path, UInt32Span* result);
    [CLink] static extern void nga_example_free_shader(void* data);
    public static int Main(String[] arguments)
    {
        void* window = nga_example_open();
        if (window == null) return 1;
        defer nga_example_close(window);
        DeviceDesc deviceDescription = .();
        deviceDescription.window = window;
        deviceDescription.swapchain_format = .bgra8_srgb;
        DeviceInit initialization = GPU.CreateDevice(deviceDescription);
        if (initialization.device == null)
        {
            Console.WriteLine("Device creation failed: {}", initialization.error);
            return 1;
        }
        Device* device = initialization.device;
        defer GPU.DestroyDevice(device);
        Console.WriteLine("Using {}", StringView(GPU.GetDeviceCaps(device).device_name));
        UInt32Span vertexShader = default;
        UInt32Span fragmentShader = default;
        nga_example_read_shader("triangle.vertex.dxil", &vertexShader);
        nga_example_read_shader("triangle.fragment.dxil", &fragmentShader);
        defer nga_example_free_shader(vertexShader.data);
        defer nga_example_free_shader(fragmentShader.data);
        if (vertexShader.data == null || fragmentShader.data == null) return 1;
        ColorTargetDesc colorTarget = .();
        colorTarget.format = .bgra8_srgb;
        GraphicsPSODesc pipelineDescription = .();
        pipelineDescription.vertex_spirv = vertexShader;
        pipelineDescription.fragment_spirv = fragmentShader;
        pipelineDescription.color_targets = .() { data = &colorTarget, size = 1 };
        PSO* pipeline = GPU.CreateGraphicsPso(device, pipelineDescription);
        if (pipeline == null) return 1;
        defer GPU.DestroyPso(pipeline);
        TimelinePoint completion = .();
        completion.semaphore = GPU.CreateTimelineSemaphore(device, 0);
        if (completion.semaphore == null) return 1;
        defer GPU.DestroyTimelineSemaphore(completion.semaphore);
        CommandPool*[2] commandPools = default;
        commandPools[0] = GPU.CreateCommandPool(device, 0);
        if (commandPools[0] == null) return 1;
        defer GPU.DestroyCommandPool(commandPools[0]);
        commandPools[1] = GPU.CreateCommandPool(device, 0);
        if (commandPools[1] == null) return 1;
        defer GPU.DestroyCommandPool(commandPools[1]);
        defer GPU.WaitIdle(device);
        bool smokeTest = arguments.Count > 0 && arguments[0] == "--smoke-test";
        uint32 renderedFrames = 0;
        while (nga_example_pump(window))
        {
            if (completion.value >= 2)
                GPU.WaitTimeline(.() { semaphore = completion.semaphore, value = completion.value - 1 });
            CommandPool* commandPool = commandPools[(int)(completion.value % 2)];
            GPU.ResetCommandPool(commandPool);
            CommandBuffer* commands = GPU.BeginCommands(commandPool);
            SwapchainFrame frame = GPU.Acquire(commands);
            if (frame.render_view == null) continue;
            ColorAttachment attachment = .();
            attachment.render_view = frame.render_view;
            attachment.load = .clear;
            RenderingDesc rendering = .();
            rendering.colors = .() { data = &attachment, size = 1 };
            GPU.BeginRenderPass(commands, rendering, .none);
            GPU.BindPso(commands, pipeline);
            GPU.Draw(commands, default, 3, 1, 0, 0);
            GPU.EndRenderPass(commands);
            GPU.EndCommands(commands);
            completion.value++;
            SubmitDesc submission = .();
            submission.commands = .() { data = &commands, size = 1 };
            submission.completion = completion;
            GPU.SubmitAndPresent(device, submission);
            if (smokeTest && ++renderedFrames == 3) break;
        }
        return 0;
    }
}
