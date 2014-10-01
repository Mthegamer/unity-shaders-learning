Shader "Learning/BasicDiffuse" 
{
	Properties 
	{
		//_MainTex ("Base (RGB)", 2D) = "white" {}
		_EmissiveColor("Emissive Color", Color) = (0.5,1,1,1)
		_AmbientColor("Ambient Color", Color) = (0.5, 0.5, 0.5, 0.5)
		_MySliderValue("This is a Slider", Range(0,10)) = 2.5
	}
	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		float4 _EmissiveColor;
		float4 _AmbientColor;
		float _MySliderValue;

		struct Input 
		{
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{
			float4 c;
			c = pow((_EmissiveColor + _AmbientColor), _MySliderValue);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
