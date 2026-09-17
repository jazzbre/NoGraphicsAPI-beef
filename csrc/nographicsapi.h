#pragma once
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
typedef void (*nga_DeleteCallback)(void* context);
#ifdef __cplusplus
#include <NoGraphicsAPI/NoGraphicsAPI.hpp>
#include <NoGraphicsAPIUtility/bump_allocator.hpp>
#include <NoGraphicsAPIUtility/delete_queue.hpp>
#include <NoGraphicsAPIUtility/heap_allocator.hpp>
#include <NoGraphicsAPIUtility/texture_allocator.hpp>
using nga_Device = gpu::Device;
using nga_Texture = gpu::Texture;
using nga_RenderView = gpu::RenderView;
using nga_PSO = gpu::PSO;
using nga_CommandBuffer = gpu::CommandBuffer;
using nga_TimelineSemaphore = gpu::TimelineSemaphore;
using nga_GpuHeapOwner = gpu::GpuHeapOwner;
using nga_TextureHeapOwner = gpu::TextureHeapOwner;
using nga_BumpAllocator = gpu::BumpAllocator;
using nga_HeapAllocator = gpu::HeapAllocator;
using nga_TextureAllocator = gpu::TextureAllocator;
using nga_DeleteQueue = gpu::DeleteQueue;
using nga_Error = gpu::Error;
using nga_MemoryType = gpu::MemoryType;
using nga_Format = gpu::Format;
using nga_TextureType = gpu::TextureType;
using nga_TextureUsage = gpu::TextureUsage;
using nga_TextureDescriptorType = gpu::TextureDescriptorType;
using nga_TextureAspect = gpu::TextureAspect;
using nga_Filter = gpu::Filter;
using nga_AddressMode = gpu::AddressMode;
using nga_CompareOp = gpu::CompareOp;
using nga_CullMode = gpu::CullMode;
using nga_BlendFactor = gpu::BlendFactor;
using nga_BlendOp = gpu::BlendOp;
using nga_IndexType = gpu::IndexType;
using nga_LoadOp = gpu::LoadOp;
using nga_StoreOp = gpu::StoreOp;
using nga_StencilOp = gpu::StencilOp;
using nga_Stage = gpu::Stage;
using nga_Access = gpu::Access;
using nga_uint32x2 = gpu::uint32x2;
using nga_uint32x3 = gpu::uint32x3;
using nga_SizeAlign = gpu::SizeAlign;
using nga_GpuRange = gpu::GpuRange;
using nga_GpuCpuRange = gpu::GpuCpuRange<gpu::byte>;
using nga_GpuHeap = gpu::GpuHeap;
using nga_TextureHeap = gpu::TextureHeap;
using nga_TimelinePoint = gpu::TimelinePoint;
using nga_TextureFormatInfo = gpu::TextureFormatInfo;
using nga_DeviceCaps = gpu::DeviceCaps;
using nga_DeviceDesc = gpu::DeviceDesc;
using nga_DeviceInit = gpu::DeviceInit;
using nga_SwapchainFrame = gpu::SwapchainFrame;
using nga_TextureDesc = gpu::TextureDesc;
using nga_RenderViewDesc = gpu::RenderViewDesc;
using nga_TextureDescriptorDesc = gpu::TextureDescriptorDesc;
using nga_TextureCopyDesc = gpu::TextureCopyDesc;
using nga_SamplerDesc = gpu::SamplerDesc;
using nga_BlendComponentState = gpu::BlendComponentState;
using nga_BlendState = gpu::BlendState;
using nga_ColorTargetDesc = gpu::ColorTargetDesc;
using nga_RasterizationState = gpu::RasterizationState;
using nga_Viewport = gpu::Viewport;
using nga_Scissor = gpu::Scissor;
using nga_StencilFaceState = gpu::StencilFaceState;
using nga_DepthStencilState = gpu::DepthStencilState;
using nga_GraphicsPSODesc = gpu::GraphicsPSODesc;
using nga_MeshPSODesc = gpu::MeshPSODesc;
using nga_ClearColor = gpu::ClearColor;
using nga_ColorAttachment = gpu::ColorAttachment;
using nga_DepthAttachment = gpu::DepthAttachment;
using nga_StencilAttachment = gpu::StencilAttachment;
using nga_RenderingDesc = gpu::RenderingDesc;
using nga_HeapAllocation = gpu::HeapAllocation<gpu::byte>;
using nga_PlacedTexture = gpu::PlacedTexture;
using nga_UInt32Span = gpu::Span<const gpu::uint32>;
using nga_ColorTargetSpan = gpu::Span<const gpu::ColorTargetDesc>;
using nga_ColorAttachmentSpan = gpu::Span<const gpu::ColorAttachment>;
using nga_CommandBufferSpan = gpu::Span<gpu::CommandBuffer* const>;
using nga_ByteSpan = gpu::ByteSpan;
#else
typedef struct nga_Device nga_Device;
typedef struct nga_Texture nga_Texture;
typedef struct nga_RenderView nga_RenderView;
typedef struct nga_PSO nga_PSO;
typedef struct nga_CommandBuffer nga_CommandBuffer;
typedef struct nga_TimelineSemaphore nga_TimelineSemaphore;
typedef struct nga_GpuHeapOwner nga_GpuHeapOwner;
typedef struct nga_TextureHeapOwner nga_TextureHeapOwner;
typedef struct nga_BumpAllocator nga_BumpAllocator;
typedef struct nga_HeapAllocator nga_HeapAllocator;
typedef struct nga_TextureAllocator nga_TextureAllocator;
typedef struct nga_DeleteQueue nga_DeleteQueue;
typedef uint8_t nga_Error;
#define NGA_Error_none ((nga_Error)(0))
#define NGA_Error_unsupported ((nga_Error)(1))
#define NGA_Error_device_lost ((nga_Error)(2))
#define NGA_Error_driver_error ((nga_Error)(3))
typedef uint8_t nga_MemoryType;
#define NGA_MemoryType_cpu_visible ((nga_MemoryType)(0))
#define NGA_MemoryType_gpu_only ((nga_MemoryType)(1))
#define NGA_MemoryType_readback ((nga_MemoryType)(2))
#define NGA_MemoryType_texture_descriptor_heap ((nga_MemoryType)(3))
#define NGA_MemoryType_sampler_descriptor_heap ((nga_MemoryType)(4))
typedef uint8_t nga_Format;
#define NGA_Format_r8_srgb ((nga_Format)(0))
#define NGA_Format_rg8_srgb ((nga_Format)(1))
#define NGA_Format_rgba8_srgb ((nga_Format)(2))
#define NGA_Format_bgra8_srgb ((nga_Format)(3))
#define NGA_Format_rgba4_unorm ((nga_Format)(4))
#define NGA_Format_r5g5b5a1_unorm ((nga_Format)(5))
#define NGA_Format_r5g6b5_unorm ((nga_Format)(6))
#define NGA_Format_r8_unorm ((nga_Format)(7))
#define NGA_Format_rg8_unorm ((nga_Format)(8))
#define NGA_Format_rgba8_unorm ((nga_Format)(9))
#define NGA_Format_bgra8_unorm ((nga_Format)(10))
#define NGA_Format_r16_unorm ((nga_Format)(11))
#define NGA_Format_rg16_unorm ((nga_Format)(12))
#define NGA_Format_rgba16_unorm ((nga_Format)(13))
#define NGA_Format_r8_uint ((nga_Format)(14))
#define NGA_Format_rg8_uint ((nga_Format)(15))
#define NGA_Format_rgba8_uint ((nga_Format)(16))
#define NGA_Format_bgra8_uint ((nga_Format)(17))
#define NGA_Format_r16_uint ((nga_Format)(18))
#define NGA_Format_rg16_uint ((nga_Format)(19))
#define NGA_Format_rgba16_uint ((nga_Format)(20))
#define NGA_Format_r32_uint ((nga_Format)(21))
#define NGA_Format_rg32_uint ((nga_Format)(22))
#define NGA_Format_rgb32_uint ((nga_Format)(23))
#define NGA_Format_rgba32_uint ((nga_Format)(24))
#define NGA_Format_r16_float ((nga_Format)(25))
#define NGA_Format_rg16_float ((nga_Format)(26))
#define NGA_Format_rgba16_float ((nga_Format)(27))
#define NGA_Format_r32_float ((nga_Format)(28))
#define NGA_Format_rg32_float ((nga_Format)(29))
#define NGA_Format_rgb32_float ((nga_Format)(30))
#define NGA_Format_rgba32_float ((nga_Format)(31))
#define NGA_Format_rgb10a2_unorm ((nga_Format)(32))
#define NGA_Format_rg11b10_float ((nga_Format)(33))
#define NGA_Format_d16_unorm ((nga_Format)(34))
#define NGA_Format_d24_unorm_s8_uint ((nga_Format)(35))
#define NGA_Format_d32_float ((nga_Format)(36))
#define NGA_Format_s8_uint ((nga_Format)(37))
#define NGA_Format_d32_float_s8_uint ((nga_Format)(38))
#define NGA_Format_eac_rg ((nga_Format)(39))
#define NGA_Format_astc_4x4_srgb ((nga_Format)(40))
#define NGA_Format_astc_4x4_unorm ((nga_Format)(41))
#define NGA_Format_bc3_srgb ((nga_Format)(42))
#define NGA_Format_bc3_unorm ((nga_Format)(43))
#define NGA_Format_bc5_rg ((nga_Format)(44))
#define NGA_Format_bc6h_ufloat ((nga_Format)(45))
#define NGA_Format_bc6h_sfloat ((nga_Format)(46))
#define NGA_Format_bc7_srgb ((nga_Format)(47))
#define NGA_Format_bc7_unorm ((nga_Format)(48))
#define NGA_Format_undefined ((nga_Format)(49))
typedef uint8_t nga_TextureType;
#define NGA_TextureType_one_d ((nga_TextureType)(0))
#define NGA_TextureType_two_d ((nga_TextureType)(1))
#define NGA_TextureType_three_d ((nga_TextureType)(2))
#define NGA_TextureType_cube ((nga_TextureType)(3))
#define NGA_TextureType_two_d_array ((nga_TextureType)(4))
#define NGA_TextureType_cube_array ((nga_TextureType)(5))
typedef uint32_t nga_TextureUsage;
#define NGA_TextureUsage_none ((nga_TextureUsage)(0))
#define NGA_TextureUsage_sampled ((nga_TextureUsage)(1u << 0u))
#define NGA_TextureUsage_storage ((nga_TextureUsage)(1u << 1u))
#define NGA_TextureUsage_color_attachment ((nga_TextureUsage)(1u << 2u))
#define NGA_TextureUsage_depth_stencil_attachment ((nga_TextureUsage)(1u << 3u))
#define NGA_TextureUsage_transfer_source ((nga_TextureUsage)(1u << 4u))
#define NGA_TextureUsage_transfer_destination ((nga_TextureUsage)(1u << 5u))
typedef uint8_t nga_TextureDescriptorType;
#define NGA_TextureDescriptorType_sampled ((nga_TextureDescriptorType)(0))
#define NGA_TextureDescriptorType_storage ((nga_TextureDescriptorType)(1))
typedef uint8_t nga_TextureAspect;
#define NGA_TextureAspect_automatic ((nga_TextureAspect)(0))
#define NGA_TextureAspect_color ((nga_TextureAspect)(1))
#define NGA_TextureAspect_depth ((nga_TextureAspect)(2))
#define NGA_TextureAspect_stencil ((nga_TextureAspect)(3))
typedef uint8_t nga_Filter;
#define NGA_Filter_nearest ((nga_Filter)(0))
#define NGA_Filter_linear ((nga_Filter)(1))
typedef uint8_t nga_AddressMode;
#define NGA_AddressMode_repeat ((nga_AddressMode)(0))
#define NGA_AddressMode_mirrored_repeat ((nga_AddressMode)(1))
#define NGA_AddressMode_clamp_to_edge ((nga_AddressMode)(2))
typedef uint8_t nga_CompareOp;
#define NGA_CompareOp_never ((nga_CompareOp)(0))
#define NGA_CompareOp_less ((nga_CompareOp)(1))
#define NGA_CompareOp_equal ((nga_CompareOp)(2))
#define NGA_CompareOp_less_equal ((nga_CompareOp)(3))
#define NGA_CompareOp_greater ((nga_CompareOp)(4))
#define NGA_CompareOp_not_equal ((nga_CompareOp)(5))
#define NGA_CompareOp_greater_equal ((nga_CompareOp)(6))
#define NGA_CompareOp_always ((nga_CompareOp)(7))
typedef uint8_t nga_CullMode;
#define NGA_CullMode_none ((nga_CullMode)(0))
#define NGA_CullMode_clockwise ((nga_CullMode)(1))
#define NGA_CullMode_counter_clockwise ((nga_CullMode)(2))
typedef uint8_t nga_BlendFactor;
#define NGA_BlendFactor_zero ((nga_BlendFactor)(0))
#define NGA_BlendFactor_one ((nga_BlendFactor)(1))
#define NGA_BlendFactor_source_color ((nga_BlendFactor)(2))
#define NGA_BlendFactor_one_minus_source_color ((nga_BlendFactor)(3))
#define NGA_BlendFactor_destination_color ((nga_BlendFactor)(4))
#define NGA_BlendFactor_one_minus_destination_color ((nga_BlendFactor)(5))
#define NGA_BlendFactor_source_alpha ((nga_BlendFactor)(6))
#define NGA_BlendFactor_one_minus_source_alpha ((nga_BlendFactor)(7))
#define NGA_BlendFactor_destination_alpha ((nga_BlendFactor)(8))
#define NGA_BlendFactor_one_minus_destination_alpha ((nga_BlendFactor)(9))
#define NGA_BlendFactor_source_alpha_saturate ((nga_BlendFactor)(10))
typedef uint8_t nga_BlendOp;
#define NGA_BlendOp_add ((nga_BlendOp)(0))
#define NGA_BlendOp_subtract ((nga_BlendOp)(1))
#define NGA_BlendOp_reverse_subtract ((nga_BlendOp)(2))
#define NGA_BlendOp_minimum ((nga_BlendOp)(3))
#define NGA_BlendOp_maximum ((nga_BlendOp)(4))
typedef uint8_t nga_IndexType;
#define NGA_IndexType_uint16 ((nga_IndexType)(0))
#define NGA_IndexType_uint32 ((nga_IndexType)(1))
typedef uint8_t nga_LoadOp;
#define NGA_LoadOp_load ((nga_LoadOp)(0))
#define NGA_LoadOp_clear ((nga_LoadOp)(1))
#define NGA_LoadOp_discard ((nga_LoadOp)(2))
typedef uint8_t nga_StoreOp;
#define NGA_StoreOp_store ((nga_StoreOp)(0))
#define NGA_StoreOp_discard ((nga_StoreOp)(1))
typedef uint8_t nga_StencilOp;
#define NGA_StencilOp_keep ((nga_StencilOp)(0))
#define NGA_StencilOp_zero ((nga_StencilOp)(1))
#define NGA_StencilOp_replace ((nga_StencilOp)(2))
#define NGA_StencilOp_increment_clamp ((nga_StencilOp)(3))
#define NGA_StencilOp_decrement_clamp ((nga_StencilOp)(4))
#define NGA_StencilOp_invert ((nga_StencilOp)(5))
#define NGA_StencilOp_increment_wrap ((nga_StencilOp)(6))
#define NGA_StencilOp_decrement_wrap ((nga_StencilOp)(7))
typedef uint64_t nga_Stage;
#define NGA_Stage_none ((nga_Stage)(0))
#define NGA_Stage_indirect ((nga_Stage)(1ull << 0u))
#define NGA_Stage_index_input ((nga_Stage)(1ull << 1u))
#define NGA_Stage_vertex ((nga_Stage)(1ull << 2u))
#define NGA_Stage_task ((nga_Stage)(1ull << 3u))
#define NGA_Stage_mesh ((nga_Stage)(1ull << 4u))
#define NGA_Stage_depth_stencil_tests ((nga_Stage)(1ull << 5u))
#define NGA_Stage_fragment ((nga_Stage)(1ull << 6u))
#define NGA_Stage_color_output ((nga_Stage)(1ull << 7u))
#define NGA_Stage_compute ((nga_Stage)(1ull << 8u))
#define NGA_Stage_transfer ((nga_Stage)(1ull << 9u))
#define NGA_Stage_host ((nga_Stage)(1ull << 10u))
#define NGA_Stage_all_commands ((nga_Stage)(1ull << 11u))
typedef uint64_t nga_Access;
#define NGA_Access_none ((nga_Access)(0))
#define NGA_Access_transfer_read ((nga_Access)(1ull << 0u))
#define NGA_Access_transfer_write ((nga_Access)(1ull << 1u))
#define NGA_Access_shader_read ((nga_Access)(1ull << 2u))
#define NGA_Access_shader_write ((nga_Access)(1ull << 3u))
#define NGA_Access_color_read ((nga_Access)(1ull << 4u))
#define NGA_Access_color_write ((nga_Access)(1ull << 5u))
#define NGA_Access_depth_stencil_read ((nga_Access)(1ull << 6u))
#define NGA_Access_depth_stencil_write ((nga_Access)(1ull << 7u))
#define NGA_Access_indirect_read ((nga_Access)(1ull << 8u))
#define NGA_Access_index_read ((nga_Access)(1ull << 9u))
#define NGA_Access_host_read ((nga_Access)(1ull << 10u))
#define NGA_Access_descriptor_read ((nga_Access)(1ull << 11u))
typedef struct nga_uint32x2 nga_uint32x2;
typedef struct nga_uint32x3 nga_uint32x3;
typedef struct nga_SizeAlign nga_SizeAlign;
typedef struct nga_GpuRange nga_GpuRange;
typedef struct nga_GpuCpuRange nga_GpuCpuRange;
typedef struct nga_GpuHeap nga_GpuHeap;
typedef struct nga_TextureHeap nga_TextureHeap;
typedef struct nga_TimelinePoint nga_TimelinePoint;
typedef struct nga_TextureFormatInfo nga_TextureFormatInfo;
typedef struct nga_DeviceCaps nga_DeviceCaps;
typedef struct nga_DeviceDesc nga_DeviceDesc;
typedef struct nga_DeviceInit nga_DeviceInit;
typedef struct nga_SwapchainFrame nga_SwapchainFrame;
typedef struct nga_TextureDesc nga_TextureDesc;
typedef struct nga_RenderViewDesc nga_RenderViewDesc;
typedef struct nga_TextureDescriptorDesc nga_TextureDescriptorDesc;
typedef struct nga_TextureCopyDesc nga_TextureCopyDesc;
typedef struct nga_SamplerDesc nga_SamplerDesc;
typedef struct nga_BlendComponentState nga_BlendComponentState;
typedef struct nga_BlendState nga_BlendState;
typedef struct nga_ColorTargetDesc nga_ColorTargetDesc;
typedef struct nga_RasterizationState nga_RasterizationState;
typedef struct nga_Viewport nga_Viewport;
typedef struct nga_Scissor nga_Scissor;
typedef struct nga_StencilFaceState nga_StencilFaceState;
typedef struct nga_DepthStencilState nga_DepthStencilState;
typedef struct nga_GraphicsPSODesc nga_GraphicsPSODesc;
typedef struct nga_MeshPSODesc nga_MeshPSODesc;
typedef struct nga_ClearColor nga_ClearColor;
typedef struct nga_ColorAttachment nga_ColorAttachment;
typedef struct nga_DepthAttachment nga_DepthAttachment;
typedef struct nga_StencilAttachment nga_StencilAttachment;
typedef struct nga_RenderingDesc nga_RenderingDesc;
typedef struct nga_HeapAllocation nga_HeapAllocation;
typedef struct nga_PlacedTexture nga_PlacedTexture;
typedef struct nga_UInt32Span nga_UInt32Span;
typedef struct nga_ColorTargetSpan nga_ColorTargetSpan;
typedef struct nga_ColorAttachmentSpan nga_ColorAttachmentSpan;
typedef struct nga_CommandBufferSpan nga_CommandBufferSpan;
typedef struct nga_ByteSpan nga_ByteSpan;
struct nga_UInt32Span
{
    uint32_t* data;
    size_t size;
};
struct nga_ColorTargetSpan
{
    nga_ColorTargetDesc* data;
    size_t size;
};
struct nga_ColorAttachmentSpan
{
    nga_ColorAttachment* data;
    size_t size;
};
struct nga_CommandBufferSpan
{
    nga_CommandBuffer** data;
    size_t size;
};
struct nga_ByteSpan
{
    uint8_t* data;
    size_t size;
};
struct nga_uint32x2
{
    uint32_t x;
    uint32_t y;
};
struct nga_uint32x3
{
    uint32_t x;
    uint32_t y;
    uint32_t z;
};
struct nga_SizeAlign
{
    uint64_t size;
    uint64_t align;
};
struct nga_GpuRange
{
    void* gpu;
    uint64_t size;
};
struct nga_GpuCpuRange
{
    uint8_t* cpu;
    uint8_t* gpu;
    uint64_t size;
};
struct nga_GpuHeap
{
    nga_GpuCpuRange range;
    const nga_GpuHeapOwner* owner;
};
struct nga_TextureHeap
{
    uint64_t size;
    const nga_TextureHeapOwner* owner;
};
struct nga_TimelinePoint
{
    nga_TimelineSemaphore* semaphore;
    uint64_t value;
};
struct nga_TextureFormatInfo
{
    nga_uint32x2 block_extent;
    uint32_t bytes_per_block;
    bool depth;
    bool stencil;
};
struct nga_DeviceCaps
{
    const char* device_name;
    uint64_t max_push_data_size;
    uint64_t texture_heap_alignment;
    uint64_t texture_descriptor_size;
    uint64_t sampler_descriptor_size;
    float timestamp_period_ns;
    uint32_t sub_texel_precision_bits;
    bool texture_compression_bc;
    bool texture_compression_astc;
    bool storage_input_output16;
};
struct nga_DeviceDesc
{
    void* window;
    nga_Format swapchain_format;
    uint32_t desired_swapchain_image_count;
    uint32_t timestamp_query_count;
};
struct nga_DeviceInit
{
    nga_Device* device;
    nga_Error error;
};
struct nga_SwapchainFrame
{
    nga_RenderView* render_view;
    nga_uint32x2 extent;
};
struct nga_TextureDesc
{
    nga_TextureType type;
    nga_uint32x3 extent;
    uint32_t mip_levels;
    uint32_t layer_count;
    nga_Format format;
    bool mutable_format;
    nga_TextureUsage usage;
};
struct nga_RenderViewDesc
{
    uint32_t mip_level;
    uint32_t slice;
};
struct nga_TextureDescriptorDesc
{
    nga_Format format;
    nga_TextureAspect aspect;
    uint32_t base_mip;
    uint32_t mip_count;
    uint32_t base_layer;
    uint32_t layer_count;
};
struct nga_TextureCopyDesc
{
    uint32_t mip_level;
    uint32_t base_slice;
    uint32_t slice_count;
    nga_uint32x3 offset;
    nga_uint32x3 extent;
    uint64_t row_pitch_bytes;
    uint64_t slice_pitch_bytes;
};
struct nga_SamplerDesc
{
    nga_Filter min_filter;
    nga_Filter mag_filter;
    nga_Filter mip_filter;
    nga_AddressMode address_u;
    nga_AddressMode address_v;
    nga_AddressMode address_w;
    bool anisotropic;
    bool compare_enabled;
    nga_CompareOp compare;
};
struct nga_BlendComponentState
{
    nga_BlendFactor source;
    nga_BlendFactor destination;
    nga_BlendOp operation;
};
struct nga_BlendState
{
    bool enabled;
    nga_BlendComponentState color;
    nga_BlendComponentState alpha;
};
struct nga_ColorTargetDesc
{
    nga_Format format;
    nga_BlendState blend;
    uint8_t write_mask;
};
struct nga_RasterizationState
{
    nga_CullMode cull;
    float depth_bias_constant;
    float depth_bias_clamp;
    float depth_bias_slope;
};
struct nga_Viewport
{
    float x;
    float y;
    float width;
    float height;
    float min_depth;
    float max_depth;
};
struct nga_Scissor
{
    int32_t x;
    int32_t y;
    uint32_t width;
    uint32_t height;
};
struct nga_StencilFaceState
{
    nga_CompareOp compare;
    nga_StencilOp fail;
    nga_StencilOp pass;
    nga_StencilOp depth_fail;
    uint8_t reference;
};
struct nga_DepthStencilState
{
    bool depth_test;
    bool depth_write;
    nga_CompareOp depth_compare;
    bool stencil_test;
    uint8_t stencil_read_mask;
    uint8_t stencil_write_mask;
    nga_StencilFaceState front;
    nga_StencilFaceState back;
};
struct nga_GraphicsPSODesc
{
    nga_UInt32Span vertex_spirv;
    nga_UInt32Span fragment_spirv;
    nga_ColorTargetSpan color_targets;
    nga_Format depth_format;
    nga_Format stencil_format;
    nga_RasterizationState rasterization;
};
struct nga_MeshPSODesc
{
    nga_UInt32Span task_spirv;
    nga_UInt32Span mesh_spirv;
    nga_UInt32Span fragment_spirv;
    nga_ColorTargetSpan color_targets;
    nga_Format depth_format;
    nga_Format stencil_format;
    nga_RasterizationState rasterization;
};
struct nga_ClearColor
{
    float x;
    float y;
    float z;
    float w;
};
struct nga_ColorAttachment
{
    nga_RenderView* render_view;
    nga_LoadOp load;
    nga_StoreOp store;
    nga_ClearColor clear;
};
struct nga_DepthAttachment
{
    nga_RenderView* render_view;
    nga_LoadOp load;
    nga_StoreOp store;
    float clear;
};
struct nga_StencilAttachment
{
    nga_RenderView* render_view;
    nga_LoadOp load;
    nga_StoreOp store;
    uint8_t clear;
};
struct nga_RenderingDesc
{
    nga_ColorAttachmentSpan colors;
    nga_DepthAttachment depth;
    nga_StencilAttachment stencil;
};
struct nga_HeapAllocation
{
    nga_GpuCpuRange range;
    uint32_t token;
};
struct nga_PlacedTexture
{
    nga_Texture* texture;
    uint32_t token;
};
#endif
#ifdef __cplusplus
extern "C"
{
#endif
    void nga_init_uint32x2(nga_uint32x2* value);
    void nga_init_uint32x3(nga_uint32x3* value);
    void nga_init_SizeAlign(nga_SizeAlign* value);
    void nga_init_GpuRange(nga_GpuRange* value);
    void nga_init_GpuCpuRange(nga_GpuCpuRange* value);
    void nga_init_GpuHeap(nga_GpuHeap* value);
    void nga_init_TextureHeap(nga_TextureHeap* value);
    void nga_init_TimelinePoint(nga_TimelinePoint* value);
    void nga_init_TextureFormatInfo(nga_TextureFormatInfo* value);
    void nga_init_DeviceCaps(nga_DeviceCaps* value);
    void nga_init_DeviceDesc(nga_DeviceDesc* value);
    void nga_init_DeviceInit(nga_DeviceInit* value);
    void nga_init_SwapchainFrame(nga_SwapchainFrame* value);
    void nga_init_TextureDesc(nga_TextureDesc* value);
    void nga_init_RenderViewDesc(nga_RenderViewDesc* value);
    void nga_init_TextureDescriptorDesc(nga_TextureDescriptorDesc* value);
    void nga_init_TextureCopyDesc(nga_TextureCopyDesc* value);
    void nga_init_SamplerDesc(nga_SamplerDesc* value);
    void nga_init_BlendComponentState(nga_BlendComponentState* value);
    void nga_init_BlendState(nga_BlendState* value);
    void nga_init_ColorTargetDesc(nga_ColorTargetDesc* value);
    void nga_init_RasterizationState(nga_RasterizationState* value);
    void nga_init_Viewport(nga_Viewport* value);
    void nga_init_Scissor(nga_Scissor* value);
    void nga_init_StencilFaceState(nga_StencilFaceState* value);
    void nga_init_DepthStencilState(nga_DepthStencilState* value);
    void nga_init_GraphicsPSODesc(nga_GraphicsPSODesc* value);
    void nga_init_MeshPSODesc(nga_MeshPSODesc* value);
    void nga_init_ClearColor(nga_ClearColor* value);
    void nga_init_ColorAttachment(nga_ColorAttachment* value);
    void nga_init_DepthAttachment(nga_DepthAttachment* value);
    void nga_init_StencilAttachment(nga_StencilAttachment* value);
    void nga_init_RenderingDesc(nga_RenderingDesc* value);
    void nga_init_HeapAllocation(nga_HeapAllocation* value);
    void nga_init_PlacedTexture(nga_PlacedTexture* value);
    void nga_get_texture_format_info(nga_Format format, nga_TextureFormatInfo* result);
    void nga_create_device(const nga_DeviceDesc* desc, nga_DeviceInit* result);
    void nga_destroy_device(nga_Device* device);
    void nga_get_device_caps(const nga_Device* device, nga_DeviceCaps* result);
    bool nga_supports_texture_format(const nga_Device* device, nga_Format format, nga_TextureUsage usage);
    void nga_get_drawable_extent(nga_Device* device, nga_uint32x2* result);
    nga_TimelineSemaphore* nga_create_timeline_semaphore(nga_Device* device, uint64_t initial_value);
    void nga_destroy_timeline_semaphore(nga_TimelineSemaphore* semaphore);
    uint64_t nga_timeline_completed_value(const nga_TimelineSemaphore* semaphore);
    void nga_wait_timeline(const nga_TimelinePoint* point);
    void nga_wait_idle(nga_Device* device);
    void nga_acquire(nga_Device* device, nga_SwapchainFrame* result);
    void nga_submit_and_present(nga_Device* device, const nga_CommandBufferSpan* commands, const nga_TimelinePoint* completion);
    void nga_create_gpu_heap(nga_Device* device, uint64_t byte_count, nga_MemoryType memory, nga_GpuHeap* result);
    void nga_destroy_gpu_heap(const nga_GpuHeap* heap);
    void nga_create_texture_heap(nga_Device* device, uint64_t byte_count, nga_TextureHeap* result);
    void nga_destroy_texture_heap(const nga_TextureHeap* heap);
    void nga_get_texture_size_align(nga_Device* device, const nga_TextureDesc* desc, nga_SizeAlign* result);
    nga_Texture* nga_create_texture(nga_Device* device, const nga_TextureDesc* desc, const nga_TextureHeap* heap, uint64_t offset);
    void nga_destroy_texture(nga_Texture* texture);
    nga_RenderView* nga_create_render_view(nga_Texture* texture, const nga_RenderViewDesc* desc);
    void nga_destroy_render_view(nga_RenderView* render_view);
    void nga_write_texture_descriptor(
        nga_Device* device,
        void* cpu_destination,
        const nga_Texture* texture,
        nga_TextureDescriptorType type,
        const nga_TextureDescriptorDesc* desc
    );
    void nga_write_sampler_descriptor(nga_Device* device, void* cpu_destination, const nga_SamplerDesc* desc);
    nga_PSO* nga_create_graphics_pso(nga_Device* device, const nga_GraphicsPSODesc* desc);
    nga_PSO* nga_create_mesh_pso(nga_Device* device, const nga_MeshPSODesc* desc);
    nga_PSO* nga_create_compute_pso(nga_Device* device, const nga_UInt32Span* compute_spirv);
    void nga_destroy_pso(nga_PSO* pso);
    nga_CommandBuffer* nga_begin_commands(nga_Device* device);
    void nga_submit(const nga_CommandBufferSpan* commands, const nga_TimelinePoint* completion);
    void nga_set_texture_descriptor_heap(nga_CommandBuffer* commands, const nga_GpuRange* heap);
    void nga_set_sampler_descriptor_heap(nga_CommandBuffer* commands, const nga_GpuRange* heap);
    void nga_copy_memory(nga_CommandBuffer* commands, const nga_GpuRange* source, const nga_GpuRange* destination);
    void nga_copy_memory_to_texture(nga_CommandBuffer* commands, const nga_GpuRange* source, nga_Texture* destination, const nga_TextureCopyDesc* copy);
    void nga_copy_texture_to_memory(nga_CommandBuffer* commands, nga_Texture* source, const nga_GpuRange* destination, const nga_TextureCopyDesc* copy);
    void nga_barrier(nga_CommandBuffer* commands, nga_Stage before, nga_Access before_access, nga_Stage after, nga_Access after_access);
    void nga_write_timestamp(nga_CommandBuffer* commands, uint64_t* gpu_destination, nga_Stage stage);
    void nga_begin_render_pass(nga_CommandBuffer* commands, const nga_RenderingDesc* desc);
    void nga_end_render_pass(nga_CommandBuffer* commands);
    void nga_set_viewport(nga_CommandBuffer* commands, const nga_Viewport* viewport);
    void nga_set_scissor(nga_CommandBuffer* commands, const nga_Scissor* scissor);
    void nga_set_depth_stencil(nga_CommandBuffer* commands, const nga_DepthStencilState* state);
    void nga_bind_pso(nga_CommandBuffer* commands, const nga_PSO* pso);
    void nga_draw(
        nga_CommandBuffer* commands,
        const nga_ByteSpan* root,
        uint32_t vertex_count,
        uint32_t instance_count,
        uint32_t first_vertex,
        uint32_t first_instance
    );
    void nga_draw_indexed(
        nga_CommandBuffer* commands,
        const nga_ByteSpan* root,
        const nga_GpuRange* indices,
        nga_IndexType type,
        uint32_t index_count,
        uint32_t instance_count,
        uint32_t first_index,
        int32_t vertex_offset,
        uint32_t first_instance
    );
    void nga_draw_indirect(nga_CommandBuffer* commands, const nga_ByteSpan* root, const nga_GpuRange* arguments, uint32_t draw_count, uint32_t stride);
    void nga_draw_indexed_indirect(
        nga_CommandBuffer* commands,
        const nga_ByteSpan* root,
        const nga_GpuRange* indices,
        nga_IndexType type,
        const nga_GpuRange* arguments,
        uint32_t draw_count,
        uint32_t stride
    );
    void nga_dispatch(nga_CommandBuffer* commands, const nga_ByteSpan* root, const nga_uint32x3* group_count);
    void nga_dispatch_indirect(nga_CommandBuffer* commands, const nga_ByteSpan* root, const nga_GpuRange* arguments);
    void nga_draw_meshlets(nga_CommandBuffer* commands, const nga_ByteSpan* root, const nga_uint32x3* group_count);
    void nga_draw_meshlets_indirect(nga_CommandBuffer* commands, const nga_ByteSpan* root, const nga_GpuRange* arguments, uint32_t draw_count, uint32_t stride);
    nga_BumpAllocator* nga_create_bump_allocator(const nga_GpuCpuRange* storage);
    void nga_destroy_bump_allocator(nga_BumpAllocator* allocator);
    void nga_bump_allocate(nga_BumpAllocator* allocator, uint64_t byte_size, nga_GpuCpuRange* result);
    void nga_bump_allocate_atomic(nga_BumpAllocator* allocator, uint64_t byte_size, nga_GpuCpuRange* result);
    void nga_reset_bump_allocator(nga_BumpAllocator* allocator);
    nga_HeapAllocator* nga_create_heap_allocator(const nga_GpuCpuRange* storage, uint32_t max_allocations);
    void nga_destroy_heap_allocator(nga_HeapAllocator* allocator);
    void nga_heap_allocate(nga_HeapAllocator* allocator, uint64_t byte_size, nga_HeapAllocation* result);
    void nga_heap_free(nga_HeapAllocator* allocator, const nga_HeapAllocation* allocation);
    void nga_reset_heap_allocator(nga_HeapAllocator* allocator);
    nga_TextureAllocator* nga_create_texture_allocator(nga_Device* device, const nga_TextureHeap* heap, uint32_t max_textures);
    void nga_destroy_texture_allocator(nga_TextureAllocator* allocator);
    void nga_allocate_placed_texture(nga_TextureAllocator* allocator, const nga_TextureDesc* desc, nga_PlacedTexture* result);
    void nga_free_placed_texture(nga_TextureAllocator* allocator, nga_PlacedTexture* texture);
    nga_DeleteQueue* nga_create_delete_queue(nga_TimelineSemaphore* timeline, uint32_t capacity);
    void nga_destroy_delete_queue(nga_DeleteQueue* queue);
    void nga_tick_delete_queue(nga_DeleteQueue* queue);
    void nga_drain_delete_queue(nga_DeleteQueue* queue);
    void nga_defer_delete(nga_DeleteQueue* queue, uint64_t retire_value, nga_DeleteCallback callback, void* context);
    void nga_gpu_range(const nga_GpuCpuRange* range, nga_GpuRange* result);
#ifdef __cplusplus
}
#endif
