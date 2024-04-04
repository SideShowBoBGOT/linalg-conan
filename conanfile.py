import os.path

from conan import ConanFile
from conan.tools.cmake import CMake


class LinalgRecipe(ConanFile):
    name = "linalg"
    version = "1.0.6"
    user = "user"
    channel = "stable"
    generators = ("CMakeToolchain", "CMakeDeps")
    settings = ("os", "build_type", "arch", "compiler")
    exports_sources = ("CMakeLists.txt", "include/*")

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

    def requirements(self):
        self.requires("type_safe/1.0.10@user/stable", transitive_headers=True)


    def build_requirements(self):
        self.tool_requires("cmake/[>=3.5]")
        self.tool_requires("type_safe/1.0.10@user/stable")

    def layout(self):
        self.folders.build = "conan_external"
        self.folders.generators = os.path.join(self.folders.build, "generators")

    def package_info(self):
        self.cpp_info.bindirs = []
        self.cpp_info.libdirs = []
