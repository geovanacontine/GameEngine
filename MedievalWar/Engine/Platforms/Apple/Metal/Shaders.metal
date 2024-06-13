#include <metal_stdlib>
using namespace metal;

struct Vertex {
    simd_float3 position [[ attribute((0)) ]];
    simd_float4 color [[ attribute((1)) ]];
};

struct RasterizerData {
    simd_float4 position [[ position ]];
    simd_float4 color;
};

struct ViewData {
    float4x4 viewMatrix;
    float4x4 projectionMatrix;
};

vertex RasterizerData basicVertexShader(
                                        const Vertex vertexIn [[ stage_in ]],
                                        constant ViewData &viewData [[ buffer(1) ]],
                                        constant float4x4 &modelMatrix [[ buffer(2) ]]
                                        ) {
    RasterizerData data;
    
    data.position = viewData.projectionMatrix * viewData.viewMatrix * modelMatrix * simd_float4(vertexIn.position, 1);
    data.color = vertexIn.color;
    
    return data;
}

fragment simd_half4 basicFragmentShader(RasterizerData data [[ stage_in ]]) {
    simd_float4 color = data.color;
    return simd_half4(color.r, color.g, color.b, color.a);
}
