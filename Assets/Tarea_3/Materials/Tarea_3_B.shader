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
		_Albedo3("Albedo3", 2D) = "white" {}
		_Albedo4("Albedo4", 2D) = "white" {}
		[Normal]_Normal("Normal", 2D) = "white" {}
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
		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform sampler2D _ColorGradient;
		uniform sampler2D _Albedo2;
		uniform float4 _Albedo2_ST;
		uniform sampler2D _Albedo3;
		uniform float4 _Albedo3_ST;
		uniform sampler2D _Albedo4;
		uniform float4 _Albedo4_ST;
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
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Normal, uv_Normal ) );
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float2 uv0_Heightmap = i.uv_texcoord * _Heightmap_ST.xy + _Heightmap_ST.zw;
			float4 tex2DNode2 = tex2D( _Heightmap, ( uv0_Heightmap + float2( 0,0 ) ) );
			float2 appendResult44 = (float2(tex2DNode2.r , 0.5));
			float4 tex2DNode42 = tex2D( _ColorGradient, appendResult44 );
			float2 uv_Albedo2 = i.uv_texcoord * _Albedo2_ST.xy + _Albedo2_ST.zw;
			float2 uv_Albedo3 = i.uv_texcoord * _Albedo3_ST.xy + _Albedo3_ST.zw;
			float2 uv_Albedo4 = i.uv_texcoord * _Albedo4_ST.xy + _Albedo4_ST.zw;
			o.Albedo = ( ( tex2D( _Albedo1, uv_Albedo1 ) * tex2DNode42.r ) + ( tex2D( _Albedo2, uv_Albedo2 ) * tex2DNode42.g ) + ( tex2D( _Albedo3, uv_Albedo3 ) * tex2DNode42.b ) + ( tex2D( _Albedo4, uv_Albedo4 ) * tex2DNode42.a ) ).rgb;
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
574;1;1281;1010;1397.877;998.124;1.736614;True;False
Node;AmplifyShaderEditor.CommentaryNode;64;-1567.011,-683.2894;Float;False;932.6549;711.5852;Vertex Displacement;8;7;4;2;23;33;34;41;40;Vertex Displacement;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1536.366,-410.5258;Float;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;23;-1535.263,-626.5729;Float;True;Property;_Heightmap;Heightmap;1;0;Create;True;0;0;False;0;None;85eebc7b33bcb1a4b95f3a345bf1499f;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-1304.768,-405.3864;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;66;-597.8945,-1561.468;Float;False;949.621;1107.553;;11;69;67;58;57;68;59;60;42;44;61;70;Splatmap;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;2;-1103.363,-630.6608;Float;True;Property;_Heightmap_Ref;Heightmap_Ref;4;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;44;-515.3947,-658.7859;Float;False;FLOAT2;4;0;FLOAT;0.5;False;1;FLOAT;0.5;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;42;-325.1188,-685.9437;Float;True;Property;_ColorGradient;ColorGradient;5;0;Create;True;0;0;False;0;None;8002a941ee229214d8d87c85da478991;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;67;-377.9495,-1160.786;Float;True;Property;_Albedo3;Albedo3;8;0;Create;True;0;0;False;0;None;73e4528b9fcd63e45afa5eace5f45e4e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;33;-1493.004,-250.598;Float;False;Property;_Displacement;Displacement;4;0;Create;True;0;0;False;0;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;58;-383.3457,-1349.491;Float;True;Property;_Albedo2;Albedo2;7;0;Create;True;0;0;False;0;None;bb4c70f346f8ef54bbedea371c8c024b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;57;-384.8505,-1524.053;Float;True;Property;_Albedo1;Albedo1;6;0;Create;True;0;0;False;0;None;2eb86db71b60f664f97cea63c9cea34a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;69;-376.2727,-967.959;Float;True;Property;_Albedo4;Albedo4;9;0;Create;True;0;0;False;0;None;ebb633db2d14da44c986ba6f5b7e37b7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;9.380651,-1132.281;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-4.642105,-1451.565;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;40;-1252.201,-140.2227;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1213.379,-249.85;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;5.891793,-1270.983;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;6.027199,-983.0502;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;25;63.73866,38.66713;Float;False;Property;_Smoothness;Smoothness;2;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;61;205.5816,-887.2258;Float;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1;74.43084,261.8772;Float;False;Property;_Tess;Tess;0;1;[IntRange];Create;True;0;0;False;0;0;16;1;16;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-1030.452,-186.6024;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;26;65.03867,-35.43285;Float;False;Property;_Metallic;Metallic;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;72;40.03918,-268.7459;Float;True;Property;_Normal;Normal;10;1;[Normal];Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;367.0403,-56.99515;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;Mati36/Tarea_3_B;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.75;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;4;0
WireConnection;2;0;23;0
WireConnection;2;1;7;0
WireConnection;44;0;2;1
WireConnection;42;1;44;0
WireConnection;68;0;67;0
WireConnection;68;1;42;3
WireConnection;59;0;57;0
WireConnection;59;1;42;1
WireConnection;34;0;2;1
WireConnection;34;1;33;0
WireConnection;60;0;58;0
WireConnection;60;1;42;2
WireConnection;70;0;69;0
WireConnection;70;1;42;4
WireConnection;61;0;59;0
WireConnection;61;1;60;0
WireConnection;61;2;68;0
WireConnection;61;3;70;0
WireConnection;41;0;34;0
WireConnection;41;1;40;0
WireConnection;0;0;61;0
WireConnection;0;1;72;0
WireConnection;0;3;26;0
WireConnection;0;4;25;0
WireConnection;0;11;41;0
WireConnection;0;14;1;0
ASEEND*/
//CHKSM=CF551438B715B6DC835E3914BA0AD3D85D2239BA