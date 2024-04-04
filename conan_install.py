import os

if os.path.exists("conan_external"):
    os.system('rm -r conan_external')

# os.system("conan install . --build=missing -sbuild_type=Release")
os.system("conan install . --build=missing -sbuild_type=Debug")