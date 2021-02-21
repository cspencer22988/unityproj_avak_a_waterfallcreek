Shader "Lockwood/Diffuse_TransparentCutout" {
	Properties {
		_BaseColor ("Base color", Vector) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			GpuProgramID 29823
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  lowp float tmpvar_9;
					  tmpvar_9 = tex_3.w;
					  alpha_1 = tmpvar_9;
					  highp float x_10;
					  x_10 = (alpha_1 - _Cutoff);
					  if ((x_10 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  lowp float tmpvar_9;
					  tmpvar_9 = tex_3.w;
					  alpha_1 = tmpvar_9;
					  highp float x_10;
					  x_10 = (alpha_1 - _Cutoff);
					  if ((x_10 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  lowp float tmpvar_9;
					  tmpvar_9 = tex_3.w;
					  alpha_1 = tmpvar_9;
					  highp float x_10;
					  x_10 = (alpha_1 - _Cutoff);
					  if ((x_10 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_1.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp float tmpvar_3;
					  tmpvar_3 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_3) * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp float tmpvar_3;
					  tmpvar_3 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_3) * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp float tmpvar_3;
					  tmpvar_3 = (unity_FogParams.x * tmpvar_1.z);
					  gl_Position = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_3) * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					uniform lowp float _Cutoff;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec3 lm_2;
					  lowp vec4 tex_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_4 * _BaseColor);
					  tex_3 = tmpvar_5;
					  mediump vec4 tmpvar_6;
					  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
					  lowp vec4 color_7;
					  color_7 = tmpvar_6;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = (unity_Lightmap_HDR.x * color_7.xyz);
					  lm_2 = tmpvar_8;
					  tex_3.xyz = (tex_3.xyz * lm_2);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  tex_3.xyz = mix (unity_FogColor.xyz, tex_3.xyz, vec3(tmpvar_9));
					  lowp float tmpvar_10;
					  tmpvar_10 = tex_3.w;
					  alpha_1 = tmpvar_10;
					  highp float x_11;
					  x_11 = (alpha_1 - _Cutoff);
					  if ((x_11 < 0.0)) {
					    discard;
					  };
					  tex_3.w = alpha_1;
					  gl_FragData[0] = tex_3;
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
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			Cull Off
			GpuProgramID 125062
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
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