//hlsl vs_1_1

#define textureCoordinateSetMAIN	textureCoordinateSet0
#define textureCoordinateSetNRML	textureCoordinateSet1
#define textureCoordinateSetDOT3	textureCoordinateSet2
#define DECLARE_textureCoordinateSets	\
	float2 textureCoordinateSet0 : TEXCOORD0 : register(v7); \
	float2 textureCoordinateSet1 : TEXCOORD1 : register(v8); \
	float4 textureCoordinateSet2 : TEXCOORD2 : register(v9);


#include "vertex_program/include/vertex_shader_constants.inc"
#include "vertex_program/include/functions.inc"

struct InputVertex
{
	float4  position              : POSITION0  : register(v0);
	float4  normal                : NORMAL0    : register(v3);
	DECLARE_textureCoordinateSets
};

struct OutputVertex
{
	float4  position              : POSITION0;
	float3  diffuse                 : COLOR0;
	float2  textureCoordinateSet0 : TEXCOORD0;
	float2  textureCoordinateSet1 : TEXCOORD1;
	float3  viewDir				  : TEXCOORD2;
	float3 PosW : TEXCOORD3;
	float3  directionToLight_t	: TEXCOORD4;
	float3  halfAngle_t             : TEXCOORD5;
};

OutputVertex main(InputVertex inputVertex)
{
	OutputVertex outputVertex;

	// transform vertex
	outputVertex.position = transform3d(inputVertex.position);
	outputVertex.PosW = rotateTranslate_o2w(inputVertex.position);
	
	outputVertex.directionToLight_t = calculateDot3LightDirection_t(inputVertex.normal, inputVertex.textureCoordinateSetDOT3);
	outputVertex.halfAngle_t = calculateHalfAngle_t(inputVertex.position, inputVertex.normal, inputVertex.textureCoordinateSetDOT3);
	
	outputVertex.diffuse  = lightData.ambient.ambientColor;

	// copy texture coordinates
	outputVertex.textureCoordinateSet0 = inputVertex.textureCoordinateSetMAIN + textureScroll;
	outputVertex.textureCoordinateSet1 = inputVertex.textureCoordinateSetNRML + textureScroll;
	
	outputVertex.viewDir = cameraPosition_w;
	
	

	return outputVertex;
}