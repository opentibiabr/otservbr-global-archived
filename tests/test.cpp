#include <catch2/catch.hpp>
#include "../src/account.hpp"

unsigned int Factorial( unsigned int number ) {
    return number <= 1 ? number : Factorial(number-1)*number;
}

TEST_CASE( "Factorials are computed", "[factorial]" ) {
    REQUIRE( Factorial(1) == 1 );
    REQUIRE( Factorial(2) == 2 );
    REQUIRE( Factorial(3) == 6 );
    REQUIRE( Factorial(10) == 3628800 );
}

TEST_CASE("Test", "[factorial]") {
	IOAccount teste;
	SECTION("combined") {
		int a = 1;
		a = teste.getCoinBalance(1);
		CHECK(a == 0);
	}
}
