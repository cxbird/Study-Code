#include <iostream>
int main()
{
  std::cout << "Enter two number:"<<std::endl;
  int v1,v2;
  std::cin >> v1 >> v2;
  std::cout << "The sum of " << v1 << " and " << v2
	    << " is " << v1 + v2 << ".\n";
  std::cout << "The Cheng of " << v1 << " and " << v2
	    << " is " << v1 * v2 << ".\n";
  return 0;
}
