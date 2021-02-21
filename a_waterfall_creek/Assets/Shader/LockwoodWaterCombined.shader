Shader "Lockwood/WaterCombined" {
	Properties {
		_BumpMap ("Normals ", 2D) = "bump" {}
		_CubeMap ("Environment ", Cube) = "white" {}
		_WaveDistortion ("Wave Distortion", Range(0, 1)) = 0.1
		_FresnelScale ("Fresnel Scale", Range(0, 1)) = 0.3
		_BumpTiling ("Bump Tiling", Vector) = (1,1,-2,3)
		_BumpDirection ("Bump Direction & Speed", Vector) = (1,1,-1,1)
		_BaseColor ("Base color", Vector) = (0.54,0.95,0.99,0.5)
		_ReflectionColor ("Reflection color", Vector) = (0.54,0.95,0.99,0.5)
		_SpecularColor ("Specular color", Vector) = (0.72,0.72,0.72,1)
		_WorldLightDir ("Specular light direction", Vector) = (0,0.1,-0.5,1)
		_Shininess ("Shininess", Range(2, 500)) = 200
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			Cull Off
			GpuProgramID 40998
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_4 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_4.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_4.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2(-((unity_FogParams.y * tmpvar_4.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_6.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_6.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2(-((unity_FogParams.y * tmpvar_6.z)));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  highp float tmpvar_6;
					  tmpvar_6 = (unity_FogParams.x * tmpvar_4.z);
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_6) * tmpvar_6));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  highp float tmpvar_6;
					  tmpvar_6 = (unity_FogParams.x * tmpvar_4.z);
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_6) * tmpvar_6));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 worldSpaceVertex_1;
					  highp vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_1 = tmpvar_3;
					  tmpvar_2.xyz = (worldSpaceVertex_1 - _WorldSpaceCameraPos);
					  tmpvar_2.w = 1.0;
					  highp vec4 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  highp float tmpvar_6;
					  tmpvar_6 = (unity_FogParams.x * tmpvar_4.z);
					  gl_Position = tmpvar_4;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_1.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = exp2((-(tmpvar_6) * tmpvar_6));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp float _WaveDistortion;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp float xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = (baseColor_2.xyz * tmpvar_11.xyz);
					  baseColor_2.w = _ReflectionColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  highp float tmpvar_8;
					  tmpvar_8 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_8) * tmpvar_8));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  highp float tmpvar_8;
					  tmpvar_8 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_8) * tmpvar_8));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec3 worldSpaceVertex_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
					  worldSpaceVertex_2 = tmpvar_5;
					  tmpvar_3.xyz = (worldSpaceVertex_2 - _WorldSpaceCameraPos);
					  tmpvar_3.w = 1.0;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  tmpvar_4 = tmpvar_1;
					  highp float tmpvar_8;
					  tmpvar_8 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = ((worldSpaceVertex_2.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  xlv_TEXCOORD3 = exp2((-(tmpvar_8) * tmpvar_8));
					  xlv_COLOR0 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec3 _SpecularColor;
					uniform highp float _Shininess;
					uniform highp vec3 _WorldLightDir;
					uniform highp float _WaveDistortion;
					uniform highp float _FresnelScale;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD3;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  mediump vec3 reflectVector_1;
					  mediump vec4 baseColor_2;
					  mediump vec3 viewVector_3;
					  mediump vec3 worldNormal_4;
					  mediump vec3 bump_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (vec3(0.0, 1.0, 0.0) + ((bump_5.xxy * _WaveDistortion) * vec3(1.0, 0.0, 1.0)));
					  worldNormal_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(worldNormal_4);
					  worldNormal_4 = tmpvar_8;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize(xlv_TEXCOORD0.xyz);
					  viewVector_3 = tmpvar_9;
					  baseColor_2 = _BaseColor;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = (viewVector_3 - (2.0 * (
					    dot (tmpvar_8, viewVector_3)
					   * tmpvar_8)));
					  reflectVector_1.yz = tmpvar_10.yz;
					  reflectVector_1.x = -(tmpvar_10.x);
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_12;
					  color_12 = tmpvar_11;
					  baseColor_2.xyz = (baseColor_2.xyz * (unity_Lightmap_HDR.x * color_12.xyz));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (0.0, 1.0, pow (dot (tmpvar_8, 
					    -(normalize((_WorldLightDir + viewVector_3)))
					  ), _Shininess));
					  mediump vec3 x_14;
					  x_14 = -(viewVector_3);
					  mediump float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp ((1.0 - max (
					    dot (x_14, (tmpvar_8 * _FresnelScale))
					  , 0.0)), 0.0, 1.0);
					  tmpvar_15 = tmpvar_16;
					  baseColor_2.xyz = (baseColor_2.xyz + (tmpvar_13 * _SpecularColor));
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = textureCube (_CubeMap, reflectVector_1);
					  baseColor_2.xyz = mix (baseColor_2, tmpvar_17, vec4(clamp (pow (tmpvar_15, 4.0), 0.0, 1.0))).xyz;
					  baseColor_2.w = _ReflectionColor.w;
					  baseColor_2.w = (baseColor_2.w * xlv_COLOR0.w);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
					  baseColor_2.xyz = mix (unity_FogColor.xyz, baseColor_2.xyz, vec3(tmpvar_18));
					  gl_FragData[0] = baseColor_2;
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
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
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
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
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
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
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
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" "SPECULAR_ON" "VERTEX_COLOUR" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			ColorMask RGB -1
			Cull Off
			GpuProgramID 126188
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_COLOR0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
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