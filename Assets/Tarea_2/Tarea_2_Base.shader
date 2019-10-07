// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mati36/Tarea_2/Base"
{
	Properties
	{
		[HDR]_Color("Color", Color) = (0,0,0,0)
		_VerticalFadeMult("VerticalFadeMult", Float) = 0
		_FadeScale("FadeScale", Float) = 0
		_FadeBias("FadeBias", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		ZWrite Off
		Blend One One
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float3 viewDir;
			float3 worldNormal;
		};

		uniform float _FadeBias;
		uniform float _FadeScale;
		uniform float4 _Color;
		uniform float _VerticalFadeMult;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 appendResult35 = (float3(0.0 , ( v.texcoord.xy.y * (0.0 + (_SinTime.z - -1.0) * (0.04 - 0.0) / (0.0 - -1.0)) ) , 0.0));
			v.vertex.xyz += appendResult35;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float temp_output_23_0 = ( 1.0 - i.uv_texcoord.y );
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult11 = dot( i.viewDir , ase_normWorldNormal );
			o.Emission = saturate( ( ( ( _FadeBias * temp_output_23_0 ) + _FadeScale ) * ( ( _Color * saturate( abs( dotResult11 ) ) ) * ( i.uv_texcoord.y * temp_output_23_0 * _VerticalFadeMult ) ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
574;9;1281;1002;181.6402;-224.8126;1;True;False
Node;AmplifyShaderEditor.WorldNormalVector;13;-510.687,349.2665;Float;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;12;-506.1449,167.5797;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;11;-280.5512,241.7684;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;10;-86.06736,183.3204;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;-234.085,421.0337;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-6.116861,619.6628;Float;False;Property;_VerticalFadeMult;VerticalFadeMult;2;0;Create;True;0;0;False;0;0;1.43;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;8;57.07382,157.6523;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-80.6402,333.8126;Float;False;Property;_FadeBias;FadeBias;4;0;Create;True;0;0;False;0;0;5.78;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-355.5072,-39.6914;Float;False;Property;_Color;Color;0;1;[HDR];Create;True;0;0;False;0;0,0,0,0;0.4627451,1.498039,2,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;23;69.0232,504.4518;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;100.3598,373.8126;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;72.49023,-25.22408;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;292.0402,479.5859;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;33;331.3598,739.8126;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;33.3598,269.8126;Float;False;Property;_FadeScale;FadeScale;3;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;471.035,384.1219;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;252.0051,284.6017;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;11;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;34;513.3598,780.8126;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0.04;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;680.3598,634.8126;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;727.3598,279.8126;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;30;752.3598,131.8126;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;35;838.3598,660.8126;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;907.2565,207.2114;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Mati36/Tarea_2/Base;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;0;12;0
WireConnection;11;1;13;0
WireConnection;10;0;11;0
WireConnection;8;0;10;0
WireConnection;23;0;17;2
WireConnection;28;0;29;0
WireConnection;28;1;23;0
WireConnection;16;0;3;0
WireConnection;16;1;8;0
WireConnection;21;0;17;2
WireConnection;21;1;23;0
WireConnection;21;2;18;0
WireConnection;24;0;16;0
WireConnection;24;1;21;0
WireConnection;25;0;28;0
WireConnection;25;1;27;0
WireConnection;34;0;33;3
WireConnection;31;0;17;2
WireConnection;31;1;34;0
WireConnection;26;0;25;0
WireConnection;26;1;24;0
WireConnection;30;0;26;0
WireConnection;35;1;31;0
WireConnection;2;2;30;0
WireConnection;2;11;35;0
ASEEND*/
//CHKSM=BC07483F44DB4211A9AEB6A1701ECC907567C99D