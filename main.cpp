#include <iostream>
#include <linalg/linalg.h>
#include <type_safe/math.hpp>
#include <type_safe/types.hpp>

int main() {
	using namespace type_safe::types::literals;

	linalg::vec<type_safe::types::double_t, 2> g{2.0, 2.0};
	std::cout << linalg::length(g) << std::endl;

	std::cout << "Hello, World!" << std::endl;

	static constexpr auto z_axis = linalg::vec<type_safe::types::double_t, 3>(0.0, 0.0, 1.0);
	linalg::rotation_quat(z_axis, type_safe::types::double_t{1.0});

	linalg::vec<type_safe::types::double_t, 4> jjj{2.0, 2.0, 1.0, 1.0};
	linalg::vec<type_safe::types::double_t, 3> kk{2.0, 1.0, 1.0};

	linalg::qrot(jjj, kk);

	return 0;
}
