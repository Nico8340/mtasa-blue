project "slimdetours"
    language "C"
    kind "StaticLib"

    defines {
        "WIN32_LEAN_AND_MEAN",
    }

    files {
        "Source/Disassembler.c",
        "Source/FuncTableHook.c",
        "Source/InlineHook.c",
        "Source/Instruction.c",
        "Source/Memory.c",
        "Source/SlimDetours.h",
        "Source/SlimDetours.inl",
        "Source/SlimDetours.NDK.inl",
        "Source/Thread.c",
        "Source/Trampoline.c",
        "Source/Transaction.c",
        "Source/Utils.inl",
    }

    vpaths {
        ["Headers/*"] = "Source/**.h",
        ["Sources/*"] = "Source/**.c",
        ["*"] = "premake5.lua"
    }

    filter "system:not windows"
        flags { "ExcludeFromBuild" }

    filter "architecture:not x86"
        flags { "ExcludeFromBuild" }
