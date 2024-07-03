#include <metal_stdlib>
using namespace metal;

struct Vertex {
    simd_float3 position [[ attribute((0)) ]];
    simd_float4 color [[ attribute((1)) ]];
    simd_float2 textureCoordinates [[ attribute((2)) ]];
};

struct RasterizerData {
    simd_float4 position [[ position ]];
    simd_float4 color;
    simd_float2 textureCoordinates;
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
    data.textureCoordinates = vertexIn.textureCoordinates;
    
    return data;
}

fragment simd_half4 basicFragmentShader(
                                        RasterizerData data [[ stage_in ]],
                                        sampler sampler2d [[ sampler(0) ]],
                                        texture2d<float> texture [[ texture(0) ]]
                                        ) {

    simd_float2 textCoord = data.textureCoordinates;
    simd_float4 color = texture.sample(sampler2d, textCoord);

    return simd_half4(color.r, color.g, color.b, color.a);
}
