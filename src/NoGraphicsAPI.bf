using System;
namespace NoGraphicsAPI;

[CRepr]
public struct Device {}
[CRepr]
public struct Texture {}
[CRepr]
public struct RenderView {}
[CRepr]
public struct PSO {}
[CRepr]
public struct CommandBuffer {}
[CRepr]
public struct TimelineSemaphore {}
[CRepr]
public struct GpuHeapOwner {}
[CRepr]
public struct TextureHeapOwner {}
[CRepr]
public struct BumpAllocator {}
[CRepr]
public struct HeapAllocator {}
[CRepr]
public struct TextureAllocator {}
[CRepr]
public struct DeleteQueue {}
public enum Error : uint8
{
    none,
    unsupported,
    device_lost,
    driver_error,
}
public enum MemoryType : uint8
{
    cpu_visible,
    gpu_only,
    readback,
    texture_descriptor_heap,
    sampler_descriptor_heap,
}
public enum Format : uint8
{
    r8_srgb,
    rg8_srgb,
    rgba8_srgb,
    bgra8_srgb,
    rgba4_unorm,
    r5g5b5a1_unorm,
    r5g6b5_unorm,
    r8_unorm,
    rg8_unorm,
    rgba8_unorm,
    bgra8_unorm,
    r16_unorm,
    rg16_unorm,
    rgba16_unorm,
    r8_uint,
    rg8_uint,
    rgba8_uint,
    bgra8_uint,
    r16_uint,
    rg16_uint,
    rgba16_uint,
    r32_uint,
    rg32_uint,
    rgb32_uint,
    rgba32_uint,
    r16_float,
    rg16_float,
    rgba16_float,
    r32_float,
    rg32_float,
    rgb32_float,
    rgba32_float,
    rgb10a2_unorm,
    rg11b10_float,
    d16_unorm,
    d24_unorm_s8_uint,
    d32_float,
    s8_uint,
    d32_float_s8_uint,
    eac_rg,
    astc_4x4_srgb,
    astc_4x4_unorm,
    bc3_srgb,
    bc3_unorm,
    bc5_rg,
    bc6h_ufloat,
    bc6h_sfloat,
    bc7_srgb,
    bc7_unorm,
    undefined,
}
public enum TextureType : uint8
{
    one_d,
    two_d,
    three_d,
    cube,
    two_d_array,
    cube_array,
}
public enum TextureUsage : uint32
{
    none = 0,
    sampled = 1 << 0,
    storage = 1 << 1,
    color_attachment = 1 << 2,
    depth_stencil_attachment = 1 << 3,
    transfer_source = 1 << 4,
    transfer_destination = 1 << 5,
}
public enum TextureDescriptorType : uint8
{
    sampled,
    storage,
}
public enum TextureAspect : uint8
{
    automatic,
    color,
    depth,
    stencil,
}
public enum Filter : uint8
{
    nearest,
    linear,
}
public enum AddressMode : uint8
{
    @repeat,
    mirrored_repeat,
    clamp_to_edge,
}
public enum CompareOp : uint8
{
    never,
    less,
    equal,
    less_equal,
    greater,
    not_equal,
    greater_equal,
    always,
}
public enum CullMode : uint8
{
    none,
    clockwise,
    counter_clockwise,
}
public enum BlendFactor : uint8
{
    zero,
    one,
    source_color,
    one_minus_source_color,
    destination_color,
    one_minus_destination_color,
    source_alpha,
    one_minus_source_alpha,
    destination_alpha,
    one_minus_destination_alpha,
    source_alpha_saturate,
}
public enum BlendOp : uint8
{
    add,
    subtract,
    reverse_subtract,
    minimum,
    maximum,
}
public enum IndexType : uint8
{
    uint16,
    uint32,
}
public enum LoadOp : uint8
{
    load,
    clear,
    discard,
}
public enum StoreOp : uint8
{
    store,
    discard,
}
public enum StencilOp : uint8
{
    keep,
    zero,
    replace,
    increment_clamp,
    decrement_clamp,
    invert,
    increment_wrap,
    decrement_wrap,
}
public enum Stage : uint64
{
    none = 0,
    indirect = 1 << 0,
    index_input = 1 << 1,
    vertex = 1 << 2,
    task = 1 << 3,
    mesh = 1 << 4,
    depth_stencil_tests = 1 << 5,
    fragment = 1 << 6,
    color_output = 1 << 7,
    compute = 1 << 8,
    transfer = 1 << 9,
    host = 1 << 10,
    all_commands = 1 << 11,
}
public enum Access : uint64
{
    none = 0,
    transfer_read = 1 << 0,
    transfer_write = 1 << 1,
    shader_read = 1 << 2,
    shader_write = 1 << 3,
    color_read = 1 << 4,
    color_write = 1 << 5,
    depth_stencil_read = 1 << 6,
    depth_stencil_write = 1 << 7,
    indirect_read = 1 << 8,
    index_read = 1 << 9,
    host_read = 1 << 10,
    descriptor_read = 1 << 11,
}
[CRepr]
public struct UInt32Span
{
    public uint32* data;
    public uint size;
}
[CRepr]
public struct ColorTargetSpan
{
    public ColorTargetDesc* data;
    public uint size;
}
[CRepr]
public struct ColorAttachmentSpan
{
    public ColorAttachment* data;
    public uint size;
}
[CRepr]
public struct CommandBufferSpan
{
    public CommandBuffer** data;
    public uint size;
}
[CRepr]
public struct ByteSpan
{
    public uint8* data;
    public uint size;
}
[CRepr]
public struct uint32x2
{
    public uint32 x;
    public uint32 y;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_uint32x2")]
    private static extern void Initialize(uint32x2* value);
}
[CRepr]
public struct uint32x3
{
    public uint32 x;
    public uint32 y;
    public uint32 z;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_uint32x3")]
    private static extern void Initialize(uint32x3* value);
}
[CRepr]
public struct SizeAlign
{
    public uint64 size;
    public uint64 align;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_SizeAlign")]
    private static extern void Initialize(SizeAlign* value);
}
[CRepr]
public struct GpuRange
{
    public void* gpu;
    public uint64 size;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_GpuRange")]
    private static extern void Initialize(GpuRange* value);
}
[CRepr]
public struct GpuCpuRange
{
    public uint8* cpu;
    public uint8* gpu;
    public uint64 size;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_GpuCpuRange")]
    private static extern void Initialize(GpuCpuRange* value);
}
[CRepr]
public struct GpuHeap
{
    public GpuCpuRange range;
    public GpuHeapOwner* owner;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_GpuHeap")]
    private static extern void Initialize(GpuHeap* value);
}
[CRepr]
public struct TextureHeap
{
    public uint64 size;
    public TextureHeapOwner* owner;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TextureHeap")]
    private static extern void Initialize(TextureHeap* value);
}
[CRepr]
public struct TimelinePoint
{
    public TimelineSemaphore* semaphore;
    public uint64 value;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TimelinePoint")]
    private static extern void Initialize(TimelinePoint* value);
}
[CRepr]
public struct TextureFormatInfo
{
    public uint32x2 block_extent;
    public uint32 bytes_per_block;
    public bool depth;
    public bool stencil;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TextureFormatInfo")]
    private static extern void Initialize(TextureFormatInfo* value);
}
[CRepr]
public struct DeviceCaps
{
    public char8* device_name;
    public uint64 max_push_data_size;
    public uint64 texture_heap_alignment;
    public uint64 texture_descriptor_size;
    public uint64 sampler_descriptor_size;
    public float timestamp_period_ns;
    public uint32 sub_texel_precision_bits;
    public bool texture_compression_bc;
    public bool texture_compression_astc;
    public bool storage_input_output16;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_DeviceCaps")]
    private static extern void Initialize(DeviceCaps* value);
}
[CRepr]
public struct DeviceDesc
{
    public void* window;
    public Format swapchain_format;
    public uint32 desired_swapchain_image_count;
    public uint32 timestamp_query_count;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_DeviceDesc")]
    private static extern void Initialize(DeviceDesc* value);
}
[CRepr]
public struct DeviceInit
{
    public Device* device;
    public Error error;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_DeviceInit")]
    private static extern void Initialize(DeviceInit* value);
}
[CRepr]
public struct SwapchainFrame
{
    public RenderView* render_view;
    public uint32x2 extent;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_SwapchainFrame")]
    private static extern void Initialize(SwapchainFrame* value);
}
[CRepr]
public struct TextureDesc
{
    public TextureType @type;
    public uint32x3 extent;
    public uint32 mip_levels;
    public uint32 layer_count;
    public Format format;
    public bool mutable_format;
    public TextureUsage usage;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TextureDesc")]
    private static extern void Initialize(TextureDesc* value);
}
[CRepr]
public struct RenderViewDesc
{
    public uint32 mip_level;
    public uint32 slice;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_RenderViewDesc")]
    private static extern void Initialize(RenderViewDesc* value);
}
[CRepr]
public struct TextureDescriptorDesc
{
    public Format format;
    public TextureAspect aspect;
    public uint32 base_mip;
    public uint32 mip_count;
    public uint32 base_layer;
    public uint32 layer_count;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TextureDescriptorDesc")]
    private static extern void Initialize(TextureDescriptorDesc* value);
}
[CRepr]
public struct TextureCopyDesc
{
    public uint32 mip_level;
    public uint32 base_slice;
    public uint32 slice_count;
    public uint32x3 offset;
    public uint32x3 extent;
    public uint64 row_pitch_bytes;
    public uint64 slice_pitch_bytes;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_TextureCopyDesc")]
    private static extern void Initialize(TextureCopyDesc* value);
}
[CRepr]
public struct SamplerDesc
{
    public Filter min_filter;
    public Filter mag_filter;
    public Filter mip_filter;
    public AddressMode address_u;
    public AddressMode address_v;
    public AddressMode address_w;
    public bool anisotropic;
    public bool compare_enabled;
    public CompareOp compare;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_SamplerDesc")]
    private static extern void Initialize(SamplerDesc* value);
}
[CRepr]
public struct BlendComponentState
{
    public BlendFactor source;
    public BlendFactor destination;
    public BlendOp operation;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_BlendComponentState")]
    private static extern void Initialize(BlendComponentState* value);
}
[CRepr]
public struct BlendState
{
    public bool enabled;
    public BlendComponentState color;
    public BlendComponentState alpha;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_BlendState")]
    private static extern void Initialize(BlendState* value);
}
[CRepr]
public struct ColorTargetDesc
{
    public Format format;
    public BlendState blend;
    public uint8 write_mask;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_ColorTargetDesc")]
    private static extern void Initialize(ColorTargetDesc* value);
}
[CRepr]
public struct RasterizationState
{
    public CullMode cull;
    public float depth_bias_constant;
    public float depth_bias_clamp;
    public float depth_bias_slope;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_RasterizationState")]
    private static extern void Initialize(RasterizationState* value);
}
[CRepr]
public struct Viewport
{
    public float x;
    public float y;
    public float width;
    public float height;
    public float min_depth;
    public float max_depth;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_Viewport")]
    private static extern void Initialize(Viewport* value);
}
[CRepr]
public struct Scissor
{
    public int32 x;
    public int32 y;
    public uint32 width;
    public uint32 height;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_Scissor")]
    private static extern void Initialize(Scissor* value);
}
[CRepr]
public struct StencilFaceState
{
    public CompareOp compare;
    public StencilOp fail;
    public StencilOp pass;
    public StencilOp depth_fail;
    public uint8 reference;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_StencilFaceState")]
    private static extern void Initialize(StencilFaceState* value);
}
[CRepr]
public struct DepthStencilState
{
    public bool depth_test;
    public bool depth_write;
    public CompareOp depth_compare;
    public bool stencil_test;
    public uint8 stencil_read_mask;
    public uint8 stencil_write_mask;
    public StencilFaceState front;
    public StencilFaceState back;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_DepthStencilState")]
    private static extern void Initialize(DepthStencilState* value);
}
[CRepr]
public struct GraphicsPSODesc
{
    public UInt32Span vertex_spirv;
    public UInt32Span fragment_spirv;
    public ColorTargetSpan color_targets;
    public Format depth_format;
    public Format stencil_format;
    public RasterizationState rasterization;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_GraphicsPSODesc")]
    private static extern void Initialize(GraphicsPSODesc* value);
}
[CRepr]
public struct MeshPSODesc
{
    public UInt32Span task_spirv;
    public UInt32Span mesh_spirv;
    public UInt32Span fragment_spirv;
    public ColorTargetSpan color_targets;
    public Format depth_format;
    public Format stencil_format;
    public RasterizationState rasterization;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_MeshPSODesc")]
    private static extern void Initialize(MeshPSODesc* value);
}
[CRepr]
public struct ClearColor
{
    public float x;
    public float y;
    public float z;
    public float w;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_ClearColor")]
    private static extern void Initialize(ClearColor* value);
}
[CRepr]
public struct ColorAttachment
{
    public RenderView* render_view;
    public LoadOp load;
    public StoreOp store;
    public ClearColor clear;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_ColorAttachment")]
    private static extern void Initialize(ColorAttachment* value);
}
[CRepr]
public struct DepthAttachment
{
    public RenderView* render_view;
    public LoadOp load;
    public StoreOp store;
    public float clear;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_DepthAttachment")]
    private static extern void Initialize(DepthAttachment* value);
}
[CRepr]
public struct StencilAttachment
{
    public RenderView* render_view;
    public LoadOp load;
    public StoreOp store;
    public uint8 clear;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_StencilAttachment")]
    private static extern void Initialize(StencilAttachment* value);
}
[CRepr]
public struct RenderingDesc
{
    public ColorAttachmentSpan colors;
    public DepthAttachment depth;
    public StencilAttachment stencil;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_RenderingDesc")]
    private static extern void Initialize(RenderingDesc* value);
}
[CRepr]
public struct HeapAllocation
{
    public GpuCpuRange range;
    public uint32 token;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_HeapAllocation")]
    private static extern void Initialize(HeapAllocation* value);
}
[CRepr]
public struct PlacedTexture
{
    public Texture* texture;
    public uint32 token;
    public this() { this = default; Initialize(&this); }
    [CallingConvention(.Cdecl), LinkName("nga_init_PlacedTexture")]
    private static extern void Initialize(PlacedTexture* value);
}
public static class GPU
{
    [CallingConvention(.Cdecl)]
    public function void DeleteCallback(void* context);
    [CallingConvention(.Cdecl), LinkName("nga_get_texture_format_info")]
    private static extern void NativeGetTextureFormatInfo(Format format, TextureFormatInfo* result);
    public static TextureFormatInfo GetTextureFormatInfo(Format format)
    {
        TextureFormatInfo result = default;
        NativeGetTextureFormatInfo(format, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_device")]
    private static extern void NativeCreateDevice(DeviceDesc* desc, DeviceInit* result);
    public static DeviceInit CreateDevice(DeviceDesc desc)
    {
        var desc;
        DeviceInit result = default;
        NativeCreateDevice(&desc, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_device")]
    private static extern void NativeDestroyDevice(Device* device);
    public static void DestroyDevice(Device* device)
    {
        NativeDestroyDevice(device);
    }
    [CallingConvention(.Cdecl), LinkName("nga_get_device_caps")]
    private static extern void NativeGetDeviceCaps(Device* device, DeviceCaps* result);
    public static DeviceCaps GetDeviceCaps(Device* device)
    {
        DeviceCaps result = default;
        NativeGetDeviceCaps(device, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_supports_texture_format")]
    private static extern bool NativeSupportsTextureFormat(Device* device, Format format, TextureUsage usage);
    public static bool SupportsTextureFormat(Device* device, Format format, TextureUsage usage)
    {
        return NativeSupportsTextureFormat(device, format, usage);
    }
    [CallingConvention(.Cdecl), LinkName("nga_get_drawable_extent")]
    private static extern void NativeGetDrawableExtent(Device* device, uint32x2* result);
    public static uint32x2 GetDrawableExtent(Device* device)
    {
        uint32x2 result = default;
        NativeGetDrawableExtent(device, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_timeline_semaphore")]
    private static extern TimelineSemaphore* NativeCreateTimelineSemaphore(Device* device, uint64 initial_value);
    public static TimelineSemaphore* CreateTimelineSemaphore(Device* device, uint64 initial_value)
    {
        return NativeCreateTimelineSemaphore(device, initial_value);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_timeline_semaphore")]
    private static extern void NativeDestroyTimelineSemaphore(TimelineSemaphore* semaphore);
    public static void DestroyTimelineSemaphore(TimelineSemaphore* semaphore)
    {
        NativeDestroyTimelineSemaphore(semaphore);
    }
    [CallingConvention(.Cdecl), LinkName("nga_timeline_completed_value")]
    private static extern uint64 NativeTimelineCompletedValue(TimelineSemaphore* semaphore);
    public static uint64 TimelineCompletedValue(TimelineSemaphore* semaphore)
    {
        return NativeTimelineCompletedValue(semaphore);
    }
    [CallingConvention(.Cdecl), LinkName("nga_wait_timeline")]
    private static extern void NativeWaitTimeline(TimelinePoint* point);
    public static void WaitTimeline(TimelinePoint point)
    {
        var point;
        NativeWaitTimeline(&point);
    }
    [CallingConvention(.Cdecl), LinkName("nga_wait_idle")]
    private static extern void NativeWaitIdle(Device* device);
    public static void WaitIdle(Device* device)
    {
        NativeWaitIdle(device);
    }
    [CallingConvention(.Cdecl), LinkName("nga_acquire")]
    private static extern void NativeAcquire(Device* device, SwapchainFrame* result);
    public static SwapchainFrame Acquire(Device* device)
    {
        SwapchainFrame result = default;
        NativeAcquire(device, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_submit_and_present")]
    private static extern void NativeSubmitAndPresent(Device* device, CommandBufferSpan* commands, TimelinePoint* completion);
    public static void SubmitAndPresent(Device* device, CommandBufferSpan commands, TimelinePoint completion)
    {
        var commands;
        var completion;
        NativeSubmitAndPresent(device, &commands, &completion);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_gpu_heap")]
    private static extern void NativeCreateGpuHeap(Device* device, uint64 byte_count, MemoryType memory, GpuHeap* result);
    public static GpuHeap CreateGpuHeap(Device* device, uint64 byte_count, MemoryType memory)
    {
        GpuHeap result = default;
        NativeCreateGpuHeap(device, byte_count, memory, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_gpu_heap")]
    private static extern void NativeDestroyGpuHeap(GpuHeap* heap);
    public static void DestroyGpuHeap(GpuHeap heap)
    {
        var heap;
        NativeDestroyGpuHeap(&heap);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_texture_heap")]
    private static extern void NativeCreateTextureHeap(Device* device, uint64 byte_count, TextureHeap* result);
    public static TextureHeap CreateTextureHeap(Device* device, uint64 byte_count)
    {
        TextureHeap result = default;
        NativeCreateTextureHeap(device, byte_count, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_texture_heap")]
    private static extern void NativeDestroyTextureHeap(TextureHeap* heap);
    public static void DestroyTextureHeap(TextureHeap heap)
    {
        var heap;
        NativeDestroyTextureHeap(&heap);
    }
    [CallingConvention(.Cdecl), LinkName("nga_get_texture_size_align")]
    private static extern void NativeGetTextureSizeAlign(Device* device, TextureDesc* desc, SizeAlign* result);
    public static SizeAlign GetTextureSizeAlign(Device* device, TextureDesc desc)
    {
        var desc;
        SizeAlign result = default;
        NativeGetTextureSizeAlign(device, &desc, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_texture")]
    private static extern Texture* NativeCreateTexture(Device* device, TextureDesc* desc, TextureHeap* heap, uint64 offset);
    public static Texture* CreateTexture(Device* device, TextureDesc desc, TextureHeap heap, uint64 offset)
    {
        var desc;
        var heap;
        return NativeCreateTexture(device, &desc, &heap, offset);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_texture")]
    private static extern void NativeDestroyTexture(Texture* texture);
    public static void DestroyTexture(Texture* texture)
    {
        NativeDestroyTexture(texture);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_render_view")]
    private static extern RenderView* NativeCreateRenderView(Texture* texture, RenderViewDesc* desc);
    public static RenderView* CreateRenderView(Texture* texture, RenderViewDesc desc)
    {
        var desc;
        return NativeCreateRenderView(texture, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_render_view")]
    private static extern void NativeDestroyRenderView(RenderView* render_view);
    public static void DestroyRenderView(RenderView* render_view)
    {
        NativeDestroyRenderView(render_view);
    }
    [CallingConvention(.Cdecl), LinkName("nga_write_texture_descriptor")]
    private static extern void NativeWriteTextureDescriptor(Device* device, void* cpu_destination, Texture* texture, TextureDescriptorType type, TextureDescriptorDesc* desc);
    public static void WriteTextureDescriptor(Device* device, void* cpu_destination, Texture* texture, TextureDescriptorType type, TextureDescriptorDesc desc)
    {
        var desc;
        NativeWriteTextureDescriptor(device, cpu_destination, texture, type, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_write_sampler_descriptor")]
    private static extern void NativeWriteSamplerDescriptor(Device* device, void* cpu_destination, SamplerDesc* desc);
    public static void WriteSamplerDescriptor(Device* device, void* cpu_destination, SamplerDesc desc)
    {
        var desc;
        NativeWriteSamplerDescriptor(device, cpu_destination, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_graphics_pso")]
    private static extern PSO* NativeCreateGraphicsPso(Device* device, GraphicsPSODesc* desc);
    public static PSO* CreateGraphicsPso(Device* device, GraphicsPSODesc desc)
    {
        var desc;
        return NativeCreateGraphicsPso(device, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_mesh_pso")]
    private static extern PSO* NativeCreateMeshPso(Device* device, MeshPSODesc* desc);
    public static PSO* CreateMeshPso(Device* device, MeshPSODesc desc)
    {
        var desc;
        return NativeCreateMeshPso(device, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_compute_pso")]
    private static extern PSO* NativeCreateComputePso(Device* device, UInt32Span* compute_spirv);
    public static PSO* CreateComputePso(Device* device, UInt32Span compute_spirv)
    {
        var compute_spirv;
        return NativeCreateComputePso(device, &compute_spirv);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_pso")]
    private static extern void NativeDestroyPso(PSO* pso);
    public static void DestroyPso(PSO* pso)
    {
        NativeDestroyPso(pso);
    }
    [CallingConvention(.Cdecl), LinkName("nga_begin_commands")]
    private static extern CommandBuffer* NativeBeginCommands(Device* device);
    public static CommandBuffer* BeginCommands(Device* device)
    {
        return NativeBeginCommands(device);
    }
    [CallingConvention(.Cdecl), LinkName("nga_submit")]
    private static extern void NativeSubmit(CommandBufferSpan* commands, TimelinePoint* completion);
    public static void Submit(CommandBufferSpan commands, TimelinePoint completion)
    {
        var commands;
        var completion;
        NativeSubmit(&commands, &completion);
    }
    [CallingConvention(.Cdecl), LinkName("nga_set_texture_descriptor_heap")]
    private static extern void NativeSetTextureDescriptorHeap(CommandBuffer* commands, GpuRange* heap);
    public static void SetTextureDescriptorHeap(CommandBuffer* commands, GpuRange heap)
    {
        var heap;
        NativeSetTextureDescriptorHeap(commands, &heap);
    }
    [CallingConvention(.Cdecl), LinkName("nga_set_sampler_descriptor_heap")]
    private static extern void NativeSetSamplerDescriptorHeap(CommandBuffer* commands, GpuRange* heap);
    public static void SetSamplerDescriptorHeap(CommandBuffer* commands, GpuRange heap)
    {
        var heap;
        NativeSetSamplerDescriptorHeap(commands, &heap);
    }
    [CallingConvention(.Cdecl), LinkName("nga_copy_memory")]
    private static extern void NativeCopyMemory(CommandBuffer* commands, GpuRange* source, GpuRange* destination);
    public static void CopyMemory(CommandBuffer* commands, GpuRange source, GpuRange destination)
    {
        var source;
        var destination;
        NativeCopyMemory(commands, &source, &destination);
    }
    [CallingConvention(.Cdecl), LinkName("nga_copy_memory_to_texture")]
    private static extern void NativeCopyMemoryToTexture(CommandBuffer* commands, GpuRange* source, Texture* destination, TextureCopyDesc* copy);
    public static void CopyMemoryToTexture(CommandBuffer* commands, GpuRange source, Texture* destination, TextureCopyDesc copy)
    {
        var source;
        var copy;
        NativeCopyMemoryToTexture(commands, &source, destination, &copy);
    }
    [CallingConvention(.Cdecl), LinkName("nga_copy_texture_to_memory")]
    private static extern void NativeCopyTextureToMemory(CommandBuffer* commands, Texture* source, GpuRange* destination, TextureCopyDesc* copy);
    public static void CopyTextureToMemory(CommandBuffer* commands, Texture* source, GpuRange destination, TextureCopyDesc copy)
    {
        var destination;
        var copy;
        NativeCopyTextureToMemory(commands, source, &destination, &copy);
    }
    [CallingConvention(.Cdecl), LinkName("nga_barrier")]
    private static extern void NativeBarrier(CommandBuffer* commands, Stage before, Access before_access, Stage after, Access after_access);
    public static void Barrier(CommandBuffer* commands, Stage before, Access before_access, Stage after, Access after_access)
    {
        NativeBarrier(commands, before, before_access, after, after_access);
    }
    [CallingConvention(.Cdecl), LinkName("nga_write_timestamp")]
    private static extern void NativeWriteTimestamp(CommandBuffer* commands, uint64* gpu_destination, Stage stage);
    public static void WriteTimestamp(CommandBuffer* commands, uint64* gpu_destination, Stage stage)
    {
        NativeWriteTimestamp(commands, gpu_destination, stage);
    }
    [CallingConvention(.Cdecl), LinkName("nga_begin_render_pass")]
    private static extern void NativeBeginRenderPass(CommandBuffer* commands, RenderingDesc* desc);
    public static void BeginRenderPass(CommandBuffer* commands, RenderingDesc desc)
    {
        var desc;
        NativeBeginRenderPass(commands, &desc);
    }
    [CallingConvention(.Cdecl), LinkName("nga_end_render_pass")]
    private static extern void NativeEndRenderPass(CommandBuffer* commands);
    public static void EndRenderPass(CommandBuffer* commands)
    {
        NativeEndRenderPass(commands);
    }
    [CallingConvention(.Cdecl), LinkName("nga_set_viewport")]
    private static extern void NativeSetViewport(CommandBuffer* commands, Viewport* viewport);
    public static void SetViewport(CommandBuffer* commands, Viewport viewport)
    {
        var viewport;
        NativeSetViewport(commands, &viewport);
    }
    [CallingConvention(.Cdecl), LinkName("nga_set_scissor")]
    private static extern void NativeSetScissor(CommandBuffer* commands, Scissor* scissor);
    public static void SetScissor(CommandBuffer* commands, Scissor scissor)
    {
        var scissor;
        NativeSetScissor(commands, &scissor);
    }
    [CallingConvention(.Cdecl), LinkName("nga_set_depth_stencil")]
    private static extern void NativeSetDepthStencil(CommandBuffer* commands, DepthStencilState* state);
    public static void SetDepthStencil(CommandBuffer* commands, DepthStencilState state)
    {
        var state;
        NativeSetDepthStencil(commands, &state);
    }
    [CallingConvention(.Cdecl), LinkName("nga_bind_pso")]
    private static extern void NativeBindPso(CommandBuffer* commands, PSO* pso);
    public static void BindPso(CommandBuffer* commands, PSO* pso)
    {
        NativeBindPso(commands, pso);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw")]
    private static extern void NativeDraw(CommandBuffer* commands, ByteSpan* root, uint32 vertex_count, uint32 instance_count, uint32 first_vertex, uint32 first_instance);
    public static void Draw(CommandBuffer* commands, ByteSpan root, uint32 vertex_count, uint32 instance_count, uint32 first_vertex, uint32 first_instance)
    {
        var root;
        NativeDraw(commands, &root, vertex_count, instance_count, first_vertex, first_instance);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw_indexed")]
    private static extern void NativeDrawIndexed(CommandBuffer* commands, ByteSpan* root, GpuRange* indices, IndexType type, uint32 index_count, uint32 instance_count, uint32 first_index, int32 vertex_offset, uint32 first_instance);
    public static void DrawIndexed(CommandBuffer* commands, ByteSpan root, GpuRange indices, IndexType type, uint32 index_count, uint32 instance_count, uint32 first_index, int32 vertex_offset, uint32 first_instance)
    {
        var root;
        var indices;
        NativeDrawIndexed(commands, &root, &indices, type, index_count, instance_count, first_index, vertex_offset, first_instance);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw_indirect")]
    private static extern void NativeDrawIndirect(CommandBuffer* commands, ByteSpan* root, GpuRange* arguments, uint32 draw_count, uint32 stride);
    public static void DrawIndirect(CommandBuffer* commands, ByteSpan root, GpuRange arguments, uint32 draw_count, uint32 stride)
    {
        var root;
        var arguments;
        NativeDrawIndirect(commands, &root, &arguments, draw_count, stride);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw_indexed_indirect")]
    private static extern void NativeDrawIndexedIndirect(CommandBuffer* commands, ByteSpan* root, GpuRange* indices, IndexType type, GpuRange* arguments, uint32 draw_count, uint32 stride);
    public static void DrawIndexedIndirect(CommandBuffer* commands, ByteSpan root, GpuRange indices, IndexType type, GpuRange arguments, uint32 draw_count, uint32 stride)
    {
        var root;
        var indices;
        var arguments;
        NativeDrawIndexedIndirect(commands, &root, &indices, type, &arguments, draw_count, stride);
    }
    [CallingConvention(.Cdecl), LinkName("nga_dispatch")]
    private static extern void NativeDispatch(CommandBuffer* commands, ByteSpan* root, uint32x3* group_count);
    public static void Dispatch(CommandBuffer* commands, ByteSpan root, uint32x3 group_count)
    {
        var root;
        var group_count;
        NativeDispatch(commands, &root, &group_count);
    }
    [CallingConvention(.Cdecl), LinkName("nga_dispatch_indirect")]
    private static extern void NativeDispatchIndirect(CommandBuffer* commands, ByteSpan* root, GpuRange* arguments);
    public static void DispatchIndirect(CommandBuffer* commands, ByteSpan root, GpuRange arguments)
    {
        var root;
        var arguments;
        NativeDispatchIndirect(commands, &root, &arguments);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw_meshlets")]
    private static extern void NativeDrawMeshlets(CommandBuffer* commands, ByteSpan* root, uint32x3* group_count);
    public static void DrawMeshlets(CommandBuffer* commands, ByteSpan root, uint32x3 group_count)
    {
        var root;
        var group_count;
        NativeDrawMeshlets(commands, &root, &group_count);
    }
    [CallingConvention(.Cdecl), LinkName("nga_draw_meshlets_indirect")]
    private static extern void NativeDrawMeshletsIndirect(CommandBuffer* commands, ByteSpan* root, GpuRange* arguments, uint32 draw_count, uint32 stride);
    public static void DrawMeshletsIndirect(CommandBuffer* commands, ByteSpan root, GpuRange arguments, uint32 draw_count, uint32 stride)
    {
        var root;
        var arguments;
        NativeDrawMeshletsIndirect(commands, &root, &arguments, draw_count, stride);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_bump_allocator")]
    private static extern NoGraphicsAPI.BumpAllocator* NativeCreateBumpAllocator(GpuCpuRange* storage);
    public static NoGraphicsAPI.BumpAllocator* CreateBumpAllocator(GpuCpuRange storage)
    {
        var storage;
        return NativeCreateBumpAllocator(&storage);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_bump_allocator")]
    private static extern void NativeDestroyBumpAllocator(NoGraphicsAPI.BumpAllocator* allocator);
    public static void DestroyBumpAllocator(NoGraphicsAPI.BumpAllocator* allocator)
    {
        NativeDestroyBumpAllocator(allocator);
    }
    [CallingConvention(.Cdecl), LinkName("nga_bump_allocate")]
    private static extern void NativeBumpAllocate(NoGraphicsAPI.BumpAllocator* allocator, uint64 byte_size, GpuCpuRange* result);
    public static GpuCpuRange BumpAllocate(NoGraphicsAPI.BumpAllocator* allocator, uint64 byte_size)
    {
        GpuCpuRange result = default;
        NativeBumpAllocate(allocator, byte_size, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_bump_allocate_atomic")]
    private static extern void NativeBumpAllocateAtomic(NoGraphicsAPI.BumpAllocator* allocator, uint64 byte_size, GpuCpuRange* result);
    public static GpuCpuRange BumpAllocateAtomic(NoGraphicsAPI.BumpAllocator* allocator, uint64 byte_size)
    {
        GpuCpuRange result = default;
        NativeBumpAllocateAtomic(allocator, byte_size, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_reset_bump_allocator")]
    private static extern void NativeResetBumpAllocator(NoGraphicsAPI.BumpAllocator* allocator);
    public static void ResetBumpAllocator(NoGraphicsAPI.BumpAllocator* allocator)
    {
        NativeResetBumpAllocator(allocator);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_heap_allocator")]
    private static extern HeapAllocator* NativeCreateHeapAllocator(GpuCpuRange* storage, uint32 max_allocations);
    public static HeapAllocator* CreateHeapAllocator(GpuCpuRange storage, uint32 max_allocations)
    {
        var storage;
        return NativeCreateHeapAllocator(&storage, max_allocations);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_heap_allocator")]
    private static extern void NativeDestroyHeapAllocator(HeapAllocator* allocator);
    public static void DestroyHeapAllocator(HeapAllocator* allocator)
    {
        NativeDestroyHeapAllocator(allocator);
    }
    [CallingConvention(.Cdecl), LinkName("nga_heap_allocate")]
    private static extern void NativeHeapAllocate(HeapAllocator* allocator, uint64 byte_size, HeapAllocation* result);
    public static HeapAllocation HeapAllocate(HeapAllocator* allocator, uint64 byte_size)
    {
        HeapAllocation result = default;
        NativeHeapAllocate(allocator, byte_size, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_heap_free")]
    private static extern void NativeHeapFree(HeapAllocator* allocator, HeapAllocation* allocation);
    public static void HeapFree(HeapAllocator* allocator, HeapAllocation allocation)
    {
        var allocation;
        NativeHeapFree(allocator, &allocation);
    }
    [CallingConvention(.Cdecl), LinkName("nga_reset_heap_allocator")]
    private static extern void NativeResetHeapAllocator(HeapAllocator* allocator);
    public static void ResetHeapAllocator(HeapAllocator* allocator)
    {
        NativeResetHeapAllocator(allocator);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_texture_allocator")]
    private static extern TextureAllocator* NativeCreateTextureAllocator(Device* device, TextureHeap* heap, uint32 max_textures);
    public static TextureAllocator* CreateTextureAllocator(Device* device, TextureHeap heap, uint32 max_textures)
    {
        var heap;
        return NativeCreateTextureAllocator(device, &heap, max_textures);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_texture_allocator")]
    private static extern void NativeDestroyTextureAllocator(TextureAllocator* allocator);
    public static void DestroyTextureAllocator(TextureAllocator* allocator)
    {
        NativeDestroyTextureAllocator(allocator);
    }
    [CallingConvention(.Cdecl), LinkName("nga_allocate_placed_texture")]
    private static extern void NativeAllocatePlacedTexture(TextureAllocator* allocator, TextureDesc* desc, PlacedTexture* result);
    public static PlacedTexture AllocatePlacedTexture(TextureAllocator* allocator, TextureDesc desc)
    {
        var desc;
        PlacedTexture result = default;
        NativeAllocatePlacedTexture(allocator, &desc, &result);
        return result;
    }
    [CallingConvention(.Cdecl), LinkName("nga_free_placed_texture")]
    private static extern void NativeFreePlacedTexture(TextureAllocator* allocator, PlacedTexture* texture);
    public static void FreePlacedTexture(TextureAllocator* allocator, PlacedTexture* texture)
    {
        NativeFreePlacedTexture(allocator, texture);
    }
    [CallingConvention(.Cdecl), LinkName("nga_create_delete_queue")]
    private static extern DeleteQueue* NativeCreateDeleteQueue(TimelineSemaphore* timeline, uint32 capacity);
    public static DeleteQueue* CreateDeleteQueue(TimelineSemaphore* timeline, uint32 capacity)
    {
        return NativeCreateDeleteQueue(timeline, capacity);
    }
    [CallingConvention(.Cdecl), LinkName("nga_destroy_delete_queue")]
    private static extern void NativeDestroyDeleteQueue(DeleteQueue* queue);
    public static void DestroyDeleteQueue(DeleteQueue* queue)
    {
        NativeDestroyDeleteQueue(queue);
    }
    [CallingConvention(.Cdecl), LinkName("nga_tick_delete_queue")]
    private static extern void NativeTickDeleteQueue(DeleteQueue* queue);
    public static void TickDeleteQueue(DeleteQueue* queue)
    {
        NativeTickDeleteQueue(queue);
    }
    [CallingConvention(.Cdecl), LinkName("nga_drain_delete_queue")]
    private static extern void NativeDrainDeleteQueue(DeleteQueue* queue);
    public static void DrainDeleteQueue(DeleteQueue* queue)
    {
        NativeDrainDeleteQueue(queue);
    }
    [CallingConvention(.Cdecl), LinkName("nga_defer_delete")]
    private static extern void NativeDeferDelete(DeleteQueue* queue, uint64 retire_value, DeleteCallback callback, void* context);
    public static void DeferDelete(DeleteQueue* queue, uint64 retire_value, DeleteCallback callback, void* context)
    {
        NativeDeferDelete(queue, retire_value, callback, context);
    }
    [CallingConvention(.Cdecl), LinkName("nga_gpu_range")]
    private static extern void NativeGpuRange(GpuCpuRange* range, GpuRange* result);
    public static GpuRange GpuRange(GpuCpuRange range)
    {
        var range;
        GpuRange result = default;
        NativeGpuRange(&range, &result);
        return result;
    }
    public static GpuRange GpuRange(GpuHeap heap) { return GpuRange(heap.range); }
}
