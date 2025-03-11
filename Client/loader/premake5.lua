project "Loader"
	language "C++"
	kind "SharedLib"
	targetname "loader"
	targetdir(buildpath("mta"))

	filter "system:windows"
		linkoptions { "/SAFESEH:NO" }

	includedirs {
		"../../Shared/sdk",
		"../sdk",
		"../../vendor",
	}

	links {
		"unrar", "d3d9",
		"Imagehlp",
		"../../vendor/nvapi/x86/nvapi.lib",
		"cryptopp",
	}

	pchheader "StdInc.h"
	pchsource "StdInc.cpp"
	forceincludes { "StdInc.h" }

	vpaths {
		["Headers/*"] = "**.h",
		["Sources"] = "*.c",
		["Resources/*"] = {"*.rc", "**.bmp"},
		["*"] = "premake5.lua"
	}

	files {
		"premake5.lua",
		"*.h",
		"*.cpp"
	}

	filter "system:windows"
		files {
			"loader.rc",
			"resource/splash.bmp"
		}

	filter "architecture:not x86"
		flags { "ExcludeFromBuild" }

	filter "system:not windows"
		flags { "ExcludeFromBuild" }
