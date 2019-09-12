// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mati36/Tarea_3_B"
{
	Properties
	{
		[IntRange]_Tess("Tess", Range( 1 , 16)) = 0
		_Heightmap("Heightmap", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Displacement("Displacement", Float) = 0
		_ColorGradient("ColorGradient", 2D) = "white" {}
		_Albedo1("Albedo1", 2D) = "white" {}
		_Albedo2("Albedo2", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha noshadow vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Heightmap;
		uniform float4 _Heightmap_ST;
		uniform float _Displacement;
		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform sampler2D _ColorGradient;
		uniform sampler2D _Albedo2;
		uniform float4 _Albedo2_ST;
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
			float4 tex2DNode2 = tex2Dlod( _Heightmap, float4( ( uv0_Heightmap + float2( 0,0 ) ), 0, 0.0) );
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( ( tex2DNode2.r * _Displacement ) * ase_vertexNormal );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float2 uv0_Heightmap = i.uv_texcoord * _Heightmap_ST.xy + _Heightmap_ST.zw;
			float4 tex2DNode2 = tex2D( _Heightmap, ( uv0_Heightmap + float2( 0,0 ) ) );
			float2 appendResult44 = (float2(tex2DNode2.r , 0.0));
			float4 tex2DNode42 = tex2D( _ColorGradient, appendResult44 );
			float2 uv_Albedo2 = i.uv_texcoord * _Albedo2_ST.xy + _Albedo2_ST.zw;
			o.Albedo = ( ( tex2D( _Albedo1, uv_Albedo1 ) * tex2DNode42.r ) + ( tex2D( _Albedo2, uv_Albedo2 ) * tex2DNode42.g ) ).rgb;
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
568;1;1281;1010;1937.701;976.6191;1.842878;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1498.5,-304.5;Float;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;23;-1231.879,-616.1743;Float;True;Property;_Heightmap;Heightmap;1;0;Create;True;0;0;False;0;e28dc97a9541e3642a48c0e3886688c5;2eb86db71b60f664f97cea63c9cea34a;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-1045.995,-316.3533;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;2;-864.5954,-385.4532;Float;True;Property;_Heightmap_Ref;Heightmap_Ref;4;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;44;-617.833,-667.643;Float;False;FLOAT2;4;0;FLOAT;0.5;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;57;-430.123,-1237.328;Float;True;Property;_Albedo1;Albedo1;6;0;Create;True;0;0;False;0;None;b297077dae62c1944ba14cad801cddf5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;58;-428.6182,-1062.766;Float;True;Property;_Albedo2;Albedo2;7;0;Create;True;0;0;False;0;None;c68296334e691ed45b62266cbc716628;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-442.4916,-758.0443;Float;True;Property;_ColorGradient;ColorGradient;5;0;Create;True;0;0;False;0;None;8002a941ee229214d8d87c85da478991;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;33;-730.6273,173.506;Float;False;Property;_Displacement;Displacement;4;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-34.35029,-1016.116;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;40;-227.2832,271.2591;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-44.88419,-1196.698;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-178.3636,161.6318;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;77.77168,199.6351;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;61;187.1373,-803.3878;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;338.4945,-379.2158;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;89.5774,511.7951;Float;False;Property;_Tess;Tess;0;1;[IntRange];Create;True;0;0;False;0;0;16;1;16;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;63.73866,38.66713;Float;False;Property;_Smoothness;Smoothness;2;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;65.03867,-35.43285;Float;False;Property;_Metallic;Metallic;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;367.0403,-56.99515;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;Mati36/Tarea_3_B;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.75;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;4;0
WireConnection;2;0;23;0
WireConnection;2;1;7;0
WireConnection;44;0;2;1
WireConnection;42;1;44;0
WireConnection;60;0;58;0
WireConnection;60;1;42;2
WireConnection;59;0;57;0
WireConnection;59;1;42;1
WireConnection;34;0;2;1
WireConnection;34;1;33;0
WireConnection;41;0;34;0
WireConnection;41;1;40;0
WireConnection;61;0;59;0
WireConnection;61;1;60;0
WireConnection;0;0;61;0
WireConnection;0;3;26;0
WireConnection;0;4;25;0
WireConnection;0;11;41;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=32CCAB7C4F3179BAD6E328E8B859E3D15B1BB18B