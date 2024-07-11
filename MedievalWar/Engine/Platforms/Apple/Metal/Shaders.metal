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

fragment simd_half4 fillFragmentShader(
                                        RasterizerData data [[ stage_in ]],
                                        sampler sampler2d [[ sampler(0) ]],
                                        texture2d<float> texture [[ texture(0) ]],
                                        constant bool &hasTexture [[ buffer(1) ]],
                                        constant float4 &material [[ buffer(2) ]]
                                        ) {
    simd_float4 color;
                                  
    if (hasTexture) {
        simd_float2 textCoord = data.textureCoordinates;
        color = texture.sample(sampler2d, textCoord);
    } else {
        color = material;
    }
                                            
    return simd_half4(color.r, color.g, color.b, color.a);
}

fragment simd_half4 outlineFragmentShader(
                                        RasterizerData data [[ stage_in ]],
                                        constant float4 &material [[ buffer(2) ]],
                                        constant float &outlineWidth [[ buffer(3) ]]
                                        ) {
    simd_float4 color = material;
    float alpha;
    float width = outlineWidth;
                                            
    if (data.textureCoordinates.x < width || data.textureCoordinates.x > 1 - width) {
        alpha = 1;
    } else if (data.textureCoordinates.y < width || data.textureCoordinates.y > 1 - width) {
        alpha = 1;
    } else {
        alpha = 0;
    }
                                            
    return simd_half4(color.r, color.g, color.b, alpha);
}
