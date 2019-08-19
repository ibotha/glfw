project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

	filter "system:macosx"
		buildoptions { "-std=c11" }
		systemversion "latest"
		staticruntime "On"
		
		files
		{
			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_window.m",
			"src/cocoa_time.c",
			"src/posix_thread.c",
			"src/nsgl_context.m",
			"src/egl_context.c",
			"src/osmesa_context.c",
		}

		defines
		{
			"_GLFW_COCOA",
            "_CRT_SECURE_NO_WARNINGS"
		}