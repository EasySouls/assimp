project "Assimp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++20"
  staticruntime "off"

  targetdir("bin/" .. outputdir .. "/%{prj.name}")
  objdir("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
	  -- Assimp Core Source Files
    "code/**.h",
    "code/**.hpp",
    "code/**.cpp",
    "code/**.inl",
    "code/**.c",

    -- Public Headers
    "include/assimp/**.h",
    "include/assimp/**.hpp",
    "include/assimp/**.inl",

    -- ZLib (for compressed formats)
    "contrib/zlib/*.c",
    "contrib/zlib/*.h",

    -- ZIP Handling
    "contrib/zip/src/**.h",
    "contrib/zip/src/**.c",
    "contrib/unzip/**.c",

    -- IrrXML (for Collada, X, etc.)
    "contrib/irrXML/*.h",
    "contrib/irrXML/*.cpp",

    -- PugiXML (for XML-based formats like FBX)
    "contrib/pugixml/src/pugixml.cpp",
    "contrib/pugixml/src/pugixml.hpp",

    -- Earcut (for polygon triangulation)
    "contrib/earcut-hpp/earcut.hpp",

    -- Poly2Tri (polygon triangulation)
    "contrib/poly2tri/poly2tri/poly2tri.h",
    "contrib/poly2tri/poly2tri/sweep/**.h",
    "contrib/poly2tri/poly2tri/sweep/**.cpp",

    -- UTF8-CPP (for SIBImporter)
    "contrib/utf8cpp/source/utf8.h",
    "contrib/utf8cpp/source/utf8/*.h",

    -- Clipper (for C4DImporter)
    "contrib/clipper/clipper.hpp",
    "contrib/clipper/c4d_file.h",

    -- RapidJSON (for glTFImporter)
    "contrib/rapidjson/include/rapidjson/*.h",
    "contrib/rapidjson/include/rapidjson/**.h",

    -- OpenDDLParser (for OpenGEXImporter)
    "contrib/openddlparser/include/openddlparser/**.h",
    "contrib/openddlparser/code/OpenDDLParser.cpp",
    "contrib/openddlparser/code/DDLNode.cpp",
    "contrib/openddlparser/code/Value.cpp",

    -- TinyUSDZ (for USDImporter)
    "contrib/tinyusdz/*.hh",
    "contrib/tinyusdz/*.cc",

    -- Meshlab (for VRMLImporter) -- optional, can be excluded if not needed
    "contrib/meshlab/autoclone/meshlab_repo-src/src/meshlabplugins/io_x3d/vrml/*.h",
    "contrib/meshlab/autoclone/meshlab_repo-src/src/meshlabplugins/io_x3d/vrml/*.cpp"
  }

  includedirs
  {
      ".",
	  "include",
      "code",

      "contrib",
      "contrib/irrXML",
      "contrib/zlib",
      "contrib/zip/src",
      "contrib/unzip",
      "contrib/pugixml/src",
      "contrib/rapidjson/include",
      "contrib/earcut-hpp",
      "contrib/poly2tri/poly2tri",
      "contrib/utf8cpp/source",
      "contrib/clipper",
      "contrib/tinyusdz",
      "contrib/openddlparser/include",
      "contrib/meshlab/autoclone/meshlab_repo-src/src/meshlabplugins/io_x3d/vrml"
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
