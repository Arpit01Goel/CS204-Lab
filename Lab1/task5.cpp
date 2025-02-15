#include <iostream>
#include <cstdint>
using namespace std;

int main() {
    uint32_t x5, x6;
    cout << "Enter value for x5: ";
    cin >> x5;
    cout << "Enter value for x6: ";
    cin >> x6;

    // Extract bits 16 down to 11 from x5
    uint32_t extracted_bits = (x5 >> 11) & 0x3F; // 0x3F is 6 bits mask (111111)

    // Clear bits 31 down to 26 in x6
    x6 &= ~(0x3F << 26);

    // Set bits 31 down to 26 in x6 with extracted bits
    x6 |= (extracted_bits << 26);

    cout << "Final value of x6: " << x6 << endl;

    return 0;
}