#include <iostream>
int main()
{
  int sum=0;
  //sum values from 1 up to 100 inclusive.
  for(int val=1;val <=100;++val)
    sum += val;
  std::cout << "Sum of 1 to 100 inclusive is "
	    << sum << std::endl;
  return 0;
}
