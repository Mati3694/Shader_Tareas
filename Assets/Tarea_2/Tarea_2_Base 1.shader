// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mati36/Tarea_2/Base 2"
{
	Properties
	{
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
			float3 viewDir;
			float3 worldNormal;
		};

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
			float3 appendResult37 = (float3(i.viewDir.x , i.viewDir.y , i.viewDir.z));
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float3 appendResult38 = (float3(ase_normWorldNormal.x , ase_normWorldNormal.y , ase_normWorldNormal.z));
			float dotResult11 = dot( appendResult37 , appendResult38 );
			float3 temp_cast_0 = (( 1.0 - abs( dotResult11 ) )).xxx;
			o.Emission = temp_cast_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
689;160;1281;1010;1172.984;235.1067;1.397857;True;False
Node;AmplifyShaderEditor.WorldNormalVector;13;-766.4943,346.4708;Float;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;12;-782.9195,157.7947;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;38;-488.0346,357.5847;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;37;-513.196,152.0997;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SinTimeNode;33;337.8597,1042.713;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;-382.2849,688.8331;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;11;-294.8511,184.5684;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;34;519.8599,1083.713;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0.04;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;686.8599,937.7126;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;10;-31.46735,209.3206;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-114.8403,537.6125;Float;False;Property;_FadeScale;FadeScale;3;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;727.3598,279.8126;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;471.035,384.1219;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3;-355.5072,-39.6914;Float;False;Property;_Color;Color;0;1;[HDR];Create;True;0;0;False;0;0,0,0,0;0.4627451,1.498039,2,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;143.8402,747.3854;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;36;288.4821,152.142;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;72.49023,-25.22408;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-228.84,601.6123;Float;False;Property;_FadeBias;FadeBias;4;0;Create;True;0;0;False;0;0;5.78;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-154.3169,887.4623;Float;False;Property;_VerticalFadeMult;VerticalFadeMult;2;0;Create;True;0;0;False;0;0;1.43;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;103.8051,552.4016;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;11;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;35;844.8599,963.7126;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-47.84023,641.612;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;30;752.3598,131.8126;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;23;-79.17686,772.2513;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;907.2565,207.2114;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Mati36/Tarea_2/Base 2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;38;0;13;1
WireConnection;38;1;13;2
WireConnection;38;2;13;3
WireConnection;37;0;12;1
WireConnection;37;1;12;2
WireConnection;37;2;12;3
WireConnection;11;0;37;0
WireConnection;11;1;38;0
WireConnection;34;0;33;3
WireConnection;31;0;17;2
WireConnection;31;1;34;0
WireConnection;10;0;11;0
WireConnection;26;0;25;0
WireConnection;26;1;24;0
WireConnection;24;0;16;0
WireConnection;24;1;21;0
WireConnection;21;0;17;2
WireConnection;21;1;23;0
WireConnection;21;2;18;0
WireConnection;36;0;10;0
WireConnection;16;0;3;0
WireConnection;25;0;28;0
WireConnection;25;1;27;0
WireConnection;35;1;31;0
WireConnection;28;0;29;0
WireConnection;28;1;23;0
WireConnection;30;0;26;0
WireConnection;23;0;17;2
WireConnection;2;2;36;0
WireConnection;2;11;35;0
ASEEND*/
//CHKSM=AA89ADDAD2572D3A170AB4D61E0A94B3E7E442F0