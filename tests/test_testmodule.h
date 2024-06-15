#ifndef TEST_TESTMODULE_H
#define TEST_TESTMODULE_H

#include "tests/test_macros.h"

/* 
https://docs.godotengine.org/en/stable/contributing/development/core_and_modules/unit_testing.html

*/
namespace Test_TestModule {
	TEST_SUITE("TestModule Suite") {
		TEST_CASE("[TestModule] Some Test!") {
			CHECK(1 == 1);
		}

	}
}

#endif
