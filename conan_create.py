import os


def create_package(path: str):
    os.system(f"conan create {path} --build=missing -sbuild_type=Debug")
    # os.system(f"conan create {path} --build=missing -sbuild_type=Release")


def crawl_directory(directory):
    for entry in os.listdir(directory):
        if entry != 'external':
            continue
        external_path = os.path.join(directory, 'external')
        if not os.path.isdir(external_path):
            continue
        for inner_entry in os.listdir(external_path):
            inner_path = os.path.join(external_path, inner_entry)
            if not os.path.isdir(inner_path):
                continue
            crawl_directory(inner_path)
            create_package(inner_path)


crawl_directory(os.curdir)
create_package(os.curdir)
