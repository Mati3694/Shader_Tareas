// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mati36/Tarea_2"
{
	Properties
	{
		[HDR]_Color0("Color 0", Color) = (0,0,0,0)
		[IntRange]_Lines("Lines", Range( 0 , 100)) = 39.9268
		_Bias("Bias", Float) = 0
		_Scale("Scale", Float) = 0
		_Pow("Pow", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.6
		#pragma surface surf Standard alpha:fade keepalpha noshadow 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
		};

		uniform float4 _Color0;
		uniform float _Bias;
		uniform float _Scale;
		uniform float _Pow;
		uniform float _Lines;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Emission = _Color0.rgb;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV71 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode71 = ( _Bias + _Scale * pow( 1.0 - fresnelNdotV71, _Pow ) );
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			o.Alpha = ( saturate( ( 1.0 - fresnelNode71 ) ) * ( ( sin( ( ase_vertex3Pos.y * _Lines ) ) + 1.0 ) * 0.5 ) );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
7;1;1154;698;1165.991;646.1788;1.80402;True;True
Node;AmplifyShaderEditor.PosVertexDataNode;74;-711.6523,258.3417;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;76;-719.4519,449.4415;Float;False;Property;_Lines;Lines;1;1;[IntRange];Create;True;0;0;False;0;39.9268;70;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;83;-872.3587,-68.60754;Float;False;Property;_Bias;Bias;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;-861.9588,6.792477;Float;False;Property;_Scale;Scale;3;0;Create;True;0;0;False;0;0;1.39;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-858.059,95.19239;Float;False;Property;_Pow;Pow;4;0;Create;True;0;0;False;0;0;0.45;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;-443.8531,315.5421;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;71;-569.4254,-104.8345;Float;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1.18;False;3;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;75;-293.0527,338.9413;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;72;-238.4262,-103.8344;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-124.8536,342.8417;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-0.05356503,346.7412;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;73;-41.50642,-104.6786;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;199.0464,216.7411;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;82;87.04468,-295.4578;Float;False;Property;_Color0;Color 0;0;1;[HDR];Create;True;0;0;False;0;0,0,0,0;2.676979,0.3440801,2.701666,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;367.0403,-56.99515;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;Mati36/Tarea_2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.75;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;77;0;74;2
WireConnection;77;1;76;0
WireConnection;71;1;83;0
WireConnection;71;2;84;0
WireConnection;71;3;85;0
WireConnection;75;0;77;0
WireConnection;72;0;71;0
WireConnection;80;0;75;0
WireConnection;81;0;80;0
WireConnection;73;0;72;0
WireConnection;78;0;73;0
WireConnection;78;1;81;0
WireConnection;0;2;82;0
WireConnection;0;9;78;0
ASEEND*/
//CHKSM=07CFA01180D8698A5B78EEBE6B61034EF548486D