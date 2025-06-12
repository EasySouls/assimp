project "Assimp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "off"

  targetdir("bin/" .. outputdir .. "/%{prj.name}")
  objdir("bin-int/" .. outputdir .. "/%{prj.name}")

  defines {
    "ASSIMP_BUILD_NO_USD_IMPORTER",
    "ASSIMP_BUILD_NO_3DS_IMPORTER",
    "ASSIMP_BUILD_NO_COLLADA_IMPORTER", 
    "ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
    "ASSIMP_BUILD_NO_C4D_IMPORTER",
    "ASSIMP_BUILD_NO_X_IMPORTER",
    "ASSIMP_BUILD_NO_BLEND_IMPORTER",

    "RAPIDJSON_HAS_STDSTRING"
   }

  files
  {
	  -- Core
      "code/Common/**.h",
      "code/Common/**.cpp",
      "code/PostProcessing/**.h",
      "code/PostProcessing/**.cpp",
      "code/CApi/**.h",
      "code/CApi/**.cpp",
      "code/Material/**.h",
      "code/Material/**.cpp",
      "code/Maths/**.h",
      "code/Maths/**.cpp",
      "code/SceneCombiner/**.h",
      "code/SceneCombiner/**.cpp",
      "code/Geometry/**.h",
      "code/Geometry/**.cpp",
      "code/GenericPropertyParser/**.h",
      "code/GenericPropertyParser/**.cpp",
      "code/Version/**.h",
      "code/Version/**.cpp",
      "code/ValidateDataStructure/**.h",
      "code/ValidateDataStructure/**.cpp",
      "code/ProcessHelper/**.h",
      "code/ProcessHelper/**.cpp",
      "code/PretransformVertices/**.h",
      "code/PretransformVertices/**.cpp",

      -- Importers
      "code/AssetLib/Obj/**.h",
      "code/AssetLib/Obj/**.cpp",
      "code/AssetLib/FBX/**.h",
      "code/AssetLib/FBX/**.cpp",
      "code/AssetLib/glTF/**.h",
      "code/AssetLib/glTF/**.cpp",
      "code/AssetLib/glTF/**.inl",
      "code/AssetLib/glTF2/**.h",
      "code/AssetLib/glTF2/**.cpp",
      "code/AssetLib/glTF2/**.inl",
      "code/AssetLib/glTFCommon/**.h",
      "code/AssetLib/glTFCommon/**.cpp",

      -- Public API
      "include/assimp/**.h",
      "include/assimp/**.inl",
      "include/assimp/**.hpp",

      -- Contrib dependencies (for these importers)
      "contrib/zlib/*.c",
      "contrib/zlib/*.h",
      "contrib/irrXML/*.cpp",
      "contrib/irrXML/*.h",
      "contrib/pugixml/src/pugixml.cpp",
      "contrib/pugixml/src/pugixml.hpp",

      -- FBX requires UTF8-CPP
      "contrib/utf8cpp/source/utf8.h",
      "contrib/utf8cpp/source/utf8/*.h",

      -- GLTF requires RapidJSON
      "contrib/rapidjson/include/rapidjson/*.h",
      "contrib/rapidjson/include/rapidjson/**.h",

      "contrib/unzip/**.c",
      "contrib/unzip/**.h",
  }

  includedirs
  {
      ".",
	  "include",
      "code",
      "code/AssetLib/glTFCommon",
      "contrib",
      "contrib/irrXML",
      "contrib/zlib",
      "contrib/utf8cpp/source",
      "contrib/pugixml/src",
      "contrib/rapidjson/include",
      "contrib/unzip",
  }

  filter "system:windows"
    systemversion "latest"

  filter "system:linux"
    pic "On"
    systemversion "latest"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"
