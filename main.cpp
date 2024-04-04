#include <iostream>
#include <linalg/linalg.h>
#include <type_safe/math.hpp>
#include <type_safe/types.hpp>

int main() {
	using namespace type_safe::types::literals;

	linalg::vec<type_safe::types::int32_t, 2> g{2, 2};
	auto len = linalg::length(g);


	std::cout << linalg::length(g) << std::endl;

	std::cout << "Hello, World!" << std::endl;
	return 0;
}
