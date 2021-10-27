Shader "Lockwood/Mobile/VertexBlend_2Tex" {
	Properties {
		_MainTex ("Texture 1 (paint 0 alpha)", 2D) = "white" {}
		_Texture2 ("Texture 2 (paint 1 alpha)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 44624
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_7;
					  mediump vec4 tmpvar_8;
					  tmpvar_8.xy = texcoord0_3;
					  tmpvar_8.z = texcoord1_2.x;
					  tmpvar_8.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_8;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_7;
					  mediump vec4 tmpvar_8;
					  tmpvar_8.xy = texcoord0_3;
					  tmpvar_8.z = texcoord1_2.x;
					  tmpvar_8.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_8;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_7;
					  mediump vec4 tmpvar_8;
					  tmpvar_8.xy = texcoord0_3;
					  tmpvar_8.z = texcoord1_2.x;
					  tmpvar_8.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_8;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_5.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_5.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_5.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_5.z);
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_10) * tmpvar_10));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_5.z);
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_10) * tmpvar_10));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_8;
					  mediump vec4 tmpvar_9;
					  tmpvar_9.xy = texcoord0_3;
					  tmpvar_9.z = texcoord1_2.x;
					  tmpvar_9.w = texcoord1_2.y;
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_5.z);
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_9;
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_10) * tmpvar_10));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = mix (tmpvar_3.xyz, tmpvar_2.xyz, xlv_COLOR0.www);
					  col1_1 = tmpvar_4;
					  mediump vec4 tmpvar_5;
					  tmpvar_5 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_6;
					  color_6 = tmpvar_5;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = (unity_Lightmap_HDR.x * color_6.xyz);
					  col1_1.xyz = (col1_1.xyz * tmpvar_7);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  col1_1.xyz = mix (unity_FogColor.xyz, col1_1.xyz, vec3(tmpvar_8));
					  gl_FragData[0] = col1_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 94081
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 vertex_5;
					  vertex_5 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_6;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_5.z = tmpvar_6;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_5.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_7;
					    if ((vertex_5.z > 0.0)) {
					      tmpvar_7 = 0.0001;
					    } else {
					      tmpvar_7 = 0.0;
					    };
					    vertex_5.z = tmpvar_7;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = vertex_5.xyz;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11.xy = texcoord0_3;
					  tmpvar_11.z = texcoord1_2.x;
					  tmpvar_11.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = tmpvar_11;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 vertex_5;
					  vertex_5 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_6;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_5.z = tmpvar_6;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_5.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_7;
					    if ((vertex_5.z > 0.0)) {
					      tmpvar_7 = 0.0001;
					    } else {
					      tmpvar_7 = 0.0;
					    };
					    vertex_5.z = tmpvar_7;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = vertex_5.xyz;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11.xy = texcoord0_3;
					  tmpvar_11.z = texcoord1_2.x;
					  tmpvar_11.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = tmpvar_11;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _Texture2_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord1_2;
					  mediump vec2 texcoord0_3;
					  mediump vec4 tmpvar_4;
					  highp vec4 vertex_5;
					  vertex_5 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_6;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_5.z = tmpvar_6;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_5.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_7;
					    if ((vertex_5.z > 0.0)) {
					      tmpvar_7 = 0.0001;
					    } else {
					      tmpvar_7 = 0.0;
					    };
					    vertex_5.z = tmpvar_7;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = vertex_5.xyz;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
					  texcoord1_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11.xy = texcoord0_3;
					  tmpvar_11.z = texcoord1_2.x;
					  tmpvar_11.w = texcoord1_2.y;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
					  xlv_TEXCOORD0 = tmpvar_11;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					uniform sampler2D _Texture2;
					varying mediump vec4 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_Texture2, xlv_TEXCOORD0.zw);
					  mediump vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = mix (tmpvar_5.xyz, tmpvar_4.xyz, xlv_COLOR0.www);
					  tex_1 = tmpvar_6;
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_7;
					  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = tmpvar_2;
					    res_7.w = tmpvar_8.w;
					    highp vec3 tmpvar_9;
					    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_7.xyz = tmpvar_9;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_10;
					    if (bool(unity_UseLinearSpace)) {
					      emission_10 = tmpvar_3;
					    } else {
					      emission_10 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = emission_10;
					    res_7 = tmpvar_11;
					  };
					  gl_FragData[0] = res_7;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Lockwood/Diffuse"
}