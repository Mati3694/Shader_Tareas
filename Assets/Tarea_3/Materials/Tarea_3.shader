// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mati36/Tarea_3"
{
	Properties
	{
		[IntRange]_Tess("Tess", Range( 1 , 16)) = 0
		_DisplacementDir("DisplacementDir", Vector) = (0,0,0,0)
		_Heightmap("Heightmap", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Displacement("Displacement", Float) = 0
		_ColorGradient("ColorGradient", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha noshadow vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Heightmap;
		uniform float4 _Heightmap_ST;
		uniform float4 _DisplacementDir;
		uniform float _Displacement;
		uniform sampler2D _ColorGradient;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform float _Tess;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 temp_cast_0 = (_Tess).xxxx;
			return temp_cast_0;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float2 uv0_Heightmap = v.texcoord.xy * _Heightmap_ST.xy + _Heightmap_ST.zw;
			float2 appendResult12 = (float2(_DisplacementDir.x , _DisplacementDir.y));
			float2 appendResult13 = (float2(_DisplacementDir.z , _DisplacementDir.w));
			float temp_output_45_0 = ( tex2Dlod( _Heightmap, float4( ( uv0_Heightmap + ( _Time.y * appendResult12 ) ), 0, 0.0) ).r * tex2Dlod( _Heightmap, float4( ( uv0_Heightmap + ( _Time.y * appendResult13 ) ), 0, 0.0) ).r );
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( ( temp_output_45_0 * _Displacement ) * ase_vertexNormal );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv0_Heightmap = i.uv_texcoord * _Heightmap_ST.xy + _Heightmap_ST.zw;
			float2 appendResult12 = (float2(_DisplacementDir.x , _DisplacementDir.y));
			float2 appendResult13 = (float2(_DisplacementDir.z , _DisplacementDir.w));
			float temp_output_45_0 = ( tex2D( _Heightmap, ( uv0_Heightmap + ( _Time.y * appendResult12 ) ) ).r * tex2D( _Heightmap, ( uv0_Heightmap + ( _Time.y * appendResult13 ) ) ).r );
			float2 appendResult44 = (float2(temp_output_45_0 , 0.0));
			o.Albedo = tex2D( _ColorGradient, appendResult44 ).rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
568;7;1281;1004;1522.991;725.3287;1.504839;True;False
Node;AmplifyShaderEditor.Vector4Node;11;-1683.1,138.9;Float;False;Property;_DisplacementDir;DisplacementDir;1;0;Create;True;0;0;False;0;0,0,0,0;0.005,0.003,0.011,-0.01;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;12;-1395.5,129.5;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;13;-1399.5,229.5;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1591.5,14.5;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1225.5,201.5;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1498.5,-304.5;Float;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1238.5,72.5;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-1045.995,-316.3533;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-1037.995,-94.35319;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;23;-1231.879,-616.1743;Float;True;Property;_Heightmap;Heightmap;2;0;Create;True;0;0;False;0;e28dc97a9541e3642a48c0e3886688c5;2eb86db71b60f664f97cea63c9cea34a;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SamplerNode;3;-880.5954,-177.4532;Float;True;Property;_Heightmap_Ref2;Heightmap_Ref2;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-864.5954,-385.4532;Float;True;Property;_Heightmap_Ref;Heightmap_Ref;4;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-577.9764,-106.2038;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-730.6273,173.506;Float;False;Property;_Displacement;Displacement;5;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-178.3636,161.6318;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;40;-227.2832,271.2591;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;44;-262.6911,-488.5672;Float;False;FLOAT2;4;0;FLOAT;0.5;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;42;-87.34966,-578.9684;Float;True;Property;_ColorGradient;ColorGradient;6;0;Create;True;0;0;False;0;None;a19798a52846df144a6b1b3bfb8f45a0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;26;65.03867,-35.43285;Float;False;Property;_Metallic;Metallic;4;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;63.73866,38.66713;Float;False;Property;_Smoothness;Smoothness;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;89.5774,511.7951;Float;False;Property;_Tess;Tess;0;1;[IntRange];Create;True;0;0;False;0;0;16;1;16;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;77.77168,199.6351;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;367.0403,-56.99515;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;Mati36/Tarea_3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.75;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;0;11;1
WireConnection;12;1;11;2
WireConnection;13;0;11;3
WireConnection;13;1;11;4
WireConnection;15;0;5;0
WireConnection;15;1;13;0
WireConnection;14;0;5;0
WireConnection;14;1;12;0
WireConnection;7;0;4;0
WireConnection;7;1;14;0
WireConnection;16;0;4;0
WireConnection;16;1;15;0
WireConnection;3;0;23;0
WireConnection;3;1;16;0
WireConnection;2;0;23;0
WireConnection;2;1;7;0
WireConnection;45;0;2;1
WireConnection;45;1;3;1
WireConnection;34;0;45;0
WireConnection;34;1;33;0
WireConnection;44;0;45;0
WireConnection;42;1;44;0
WireConnection;41;0;34;0
WireConnection;41;1;40;0
WireConnection;0;0;42;0
WireConnection;0;3;26;0
WireConnection;0;4;25;0
WireConnection;0;11;41;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=1D9658E12950526EB9D13031A1D70213516FEE0D