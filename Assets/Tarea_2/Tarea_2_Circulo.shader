// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tarea_2_Circulo"
{
	Properties
	{
		_Divisions("Divisions", Float) = 0
		_Radius("Radius", Float) = 0
		[HDR]_Color("Color", Color) = (1,1,1,1)
		_DispSpeed("DispSpeed", Range( -20 , 20)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		Blend One One
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _DispSpeed;
		uniform float _Divisions;
		uniform float _Radius;
		uniform float4 _Color;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float mulTime20 = _Time.y * _DispSpeed;
			float temp_output_2_0 = distance( i.uv_texcoord , float2( 0.5,0.5 ) );
			float temp_output_5_0 = ( temp_output_2_0 * _Divisions );
			o.Emission = ( ( 1.0 - (0.0 + (sin( ( mulTime20 + temp_output_5_0 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) * ( 1.0 - saturate( ( temp_output_2_0 * _Radius ) ) ) * _Color ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
348;485;1281;1004;1881.6;280.9861;1.407295;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1049.5,18.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;2;-760.5,28.5;Float;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-701.053,279.8344;Float;False;Property;_Divisions;Divisions;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-1124.476,-116.3326;Float;False;Property;_DispSpeed;DispSpeed;4;0;Create;True;0;0;False;0;0;0;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-543.4271,8.35408;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;20;-806.4271,-105.0744;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;21;-574.2233,-119.1473;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-736.063,417.032;Float;False;Property;_Radius;Radius;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-495.4157,304.4484;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;18;-454.6031,-86.77947;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;19;-306.8374,-37.52414;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;14;-337.7986,283.339;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3;-170.5,43.5;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;15;-218.1783,352.2965;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;16;18.24802,-109.2962;Float;False;Property;_Color;Color;3;1;[HDR];Create;True;0;0;False;0;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;9;-306.5,42.5;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;68.90945,177.792;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FractNode;10;-426.7703,34.26321;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;278.6442,22.51672;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Tarea_2_Circulo;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;5;0;2;0
WireConnection;5;1;7;0
WireConnection;20;0;22;0
WireConnection;21;0;20;0
WireConnection;21;1;5;0
WireConnection;12;0;2;0
WireConnection;12;1;11;0
WireConnection;18;0;21;0
WireConnection;19;0;18;0
WireConnection;14;0;12;0
WireConnection;3;0;19;0
WireConnection;15;0;14;0
WireConnection;9;0;10;0
WireConnection;13;0;3;0
WireConnection;13;1;15;0
WireConnection;13;2;16;0
WireConnection;10;0;5;0
WireConnection;0;2;13;0
ASEEND*/
//CHKSM=2FD914B50D24E8495A5CFB88AD52D55D26250DF6